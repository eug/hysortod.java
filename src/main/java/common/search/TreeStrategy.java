package common.search;

import java.util.Objects;
import common.Hypercube;

public class TreeStrategy extends AbstractDensityStrategy {
	
	private Node root;
	
	// Minimum number of rows to allow sub-mapping 
	private final int minSplit;
	
	// Maximum number of dimensions to map
	protected int numMappedDimensions;
	
	public TreeStrategy() {
		this(100);
	}
	
	public TreeStrategy(int minSplit) {		
		// Set the minimum number of rows to allow sub-mapping
		// When the value is 0 this parameter has no effect
		this.minSplit = minSplit;
	}

	@Override
	public IDensityStrategy buildIndex(Hypercube[] H) {
		this.H = H;
		this.Wmax = 0;
		
		// The root node maps the whole dataset
		this.root = new Node(-1, 0, H.length - 1);
		
		// Start recursive mapping from the first dimension
		buildIndex(this.root, 0);
		
		return this;
	}
	
	private void buildIndex(Node parent, int col) {

		// Stop sub-mapping when the parent node map less than minSplit hypercubes
		if (parent.end - parent.begin < this.minSplit)
			return;
		
		// Get the first value from the given range (minRowIdx, maxRowIdx)
		int value = this.H[parent.begin].getCoordAt(col);

		// Initialise the next range
		int begin = parent.begin;
		int end = -1;

		// map the values in the current range
		int i = parent.begin;
		for (; i <= parent.end; i++) {
		
			// when the value change the node is created
			if (H[i].getCoordAt(col) != value) {
				
				// mark the end of the current value 
				end = i - 1;
				
				// create node for 'value' in 'col'
				Node child = new Node(value, begin, end);				
				parent.add(child);
				
				// map child values in the next dimension
				buildIndex(child, col + 1);

				// start new range
				begin = i;

				// update value
				value = this.H[i].getCoordAt(col);
			}
		}

		// map last value
		end = i - 1;
		Node child = new Node(value, begin, end);
		parent.add(child);

		buildIndex(child, col + 1);
	}
	
	private int density(int i, Node parent, int col) {
		int density = 0;
			
		if (parent.childs.isEmpty()) {
			for (int k = parent.begin; k <= parent.end; k++) {
				if (isImmediate(H[i], H[k])) {
					density += H[k].getDensity();
				}
			}
		} else {

			int lftVal = H[i].getCoordAt(col) - 1;
			int midVal = H[i].getCoordAt(col);
			int rgtVal = H[i].getCoordAt(col) + 1;
			
			Node lftNode = parent.childs.get(lftVal);
			Node midNode = parent.childs.get(midVal);
			Node rgtNode = parent.childs.get(rgtVal);
			
			int nextCol = Math.min(col + 1, H[i].getNumDimensions() - 1);
			
			if (Objects.nonNull(lftNode)) { density += density(i, lftNode, nextCol); }
			if (Objects.nonNull(midNode)) { density += density(i, midNode, nextCol); }
			if (Objects.nonNull(rgtNode)) { density += density(i, rgtNode, nextCol); }
		}
		
		return density;
	}

	@Override
	public int[] getDensities() {
		int n = H.length;
		int[] W = new int[n];

		for (int i = 0; i < n; i++) {
			W[i] = density(i, root, 0);
			Wmax = Math.max(Wmax, W[i]);
		}

		return W;
	}
	
}
