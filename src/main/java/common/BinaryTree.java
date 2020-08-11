package common;

import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.Objects;

/**
 * 
 * @source https://www.baeldung.com/java-binary-tree
 */
public class BinaryTree<T extends Comparable<T>> implements Iterable<T> {

    private Node<T> root;

    public void add(T value) {
        root = addRecursive(null, root, value);
    }

    private Node<T> addRecursive(Node<T> parent, Node<T> current, T value) {

        if (Objects.isNull(current)) {
            return new Node<T>(parent, value);
        }

        if (value.compareTo(current.value) < 0) {
            current.left = addRecursive(current, current.left, value);
        } else if (value.compareTo(current.value) > 0) {
            current.right = addRecursive(current, current.right, value);
        }

        return current;
    }

    public boolean isEmpty() {
        return Objects.isNull(root);
    }

    public int size() {
        return getSizeRecursive(root);
    }

    private int getSizeRecursive(Node<T> current) {
        return Objects.isNull(current) ? 0 : getSizeRecursive(current.left) + 1 + getSizeRecursive(current.right);
    }

    public boolean contains(T value) {
        return containsRecursive(root, value);
    }

    private boolean containsRecursive(Node<T> current, T value) {
        if (Objects.isNull(current)) {
            return false;
        }

        if (value.compareTo(current.value) == 0) {
            return true;
        }

        return value.compareTo(current.value) < 0
        	? containsRecursive(current.left, value)
        	: containsRecursive(current.right, value);
    }

    public T get(T value) {
    	return getRecursive(root, value);
    }
    
    private T getRecursive(Node<T> current, T value) {
    	if (Objects.isNull(current))
    		return null;
    	
    	if (value.compareTo(current.value) == 0)
    		return current.value;
    	
		return value.compareTo(current.value) < 0
			? getRecursive(current.left, value)
			: getRecursive(current.right, value);
	}

	public void delete(T value) {
        root = deleteRecursive(root, value);
    }

    private Node<T> deleteRecursive(Node<T> current, T value) {
        if (Objects.isNull(current)) {
            return null;
        }

        if (value.compareTo(current.value) == 0) {
            // Case 1: no children
            if (current.left == null && current.right == null) {
                return null;
            }

            // Case 2: only 1 child
            if (current.right == null) {
                return current.left;
            }

            if (current.left == null) {
                return current.right;
            }

            // Case 3: 2 children
            T smallestValue = findSmallestValue(current.right);
            current.value = smallestValue;
            current.right = deleteRecursive(current.right, smallestValue);
            return current;
        }
        if (value.compareTo(current.value) < 0) {
            current.left = deleteRecursive(current.left, value);
            return current;
        }

        current.right = deleteRecursive(current.right, value);
        return current;
    }

    private T findSmallestValue(Node<T> root) {
        return root.left == null ? root.value : findSmallestValue(root.left);
    }

	@Override
	public Iterator<T> iterator() {
		return new TreeIterator(root);
	}
	
	/**
	 * @source https://stackoverflow.com/a/12851421
	 */
	private class TreeIterator implements Iterator<T>{
	    private Node<T> next;

	    public TreeIterator(Node<T> root) {
	        next = root;
	        if(next == null)
	            return;

	        while (next.left != null)
	           next = next.left;
	    }

	    public boolean hasNext(){
	        return Objects.nonNull(next);
	    }

	    public T next(){
	        if(!hasNext()) throw new NoSuchElementException();
	        Node<T> r = next;

	        // If you can walk right, walk right, then fully left.
	        // otherwise, walk up until you come from left.
	        if (Objects.nonNull(next.right)) {
	            next = next.right;
	            while (Objects.nonNull(next.left))
	                next = next.left;
	            return r.value;
	        }

	        while(true) {
	            if (Objects.isNull(next.parent)) {
	                next = null;
	                return r.value;
	            }
	            if(next.parent.left == next) {
	                next = next.parent;
	               return r.value;
	            }
	            next = next.parent;
	        }
	     }
	 }
	
    
    @SuppressWarnings("hiding")
	private class Node<T> {
        public T value;
        public Node<T> left;
        public Node<T> right;
        public Node<T> parent;

        public Node(Node<T> parent, T value) {
            this.right = null;
            this.left = null;
            this.parent = parent;
            this.value = value;
        }
    }


}