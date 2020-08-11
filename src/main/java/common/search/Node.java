package common.search;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Objects;

public class Node {
	
	// Index information
	public final int value, begin, end;
	public final HashMap<Integer, Node> childs;
	
	@SuppressWarnings("unchecked")
	public Node(int value, int begin, int end) {
		this.childs = new HashMap<>();
		this.value = value;
		this.begin = begin;
		this.end = end;
	}
	
	@Override
	public String toString() {
		return "(" + begin + "," + end + ")";
	}

	public void add(Node node) {
		if (Objects.nonNull(node)) {
			childs.put(node.value, node);
		}
	}

}
