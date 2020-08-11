package common.search;

import common.Hypercube;

abstract class AbstractDensityStrategy implements IDensityStrategy {

	// Max hypercube neighborhood density
	protected int Wmax;
	
	// Local reference for search
	protected Hypercube[] H; 

	public double getMaxDensity() {
		return (double) this.Wmax;
	}

	protected boolean isImmediate(Hypercube hi, Hypercube hk) {
		final int[] p = hi.getCoords();
		final int[] q = hk.getCoords();
		for (int j = p.length - 1; j >= 0; j--)
			if (Math.abs(p[j] - q[j]) > 1)
				return false;
		return true;
	}

	protected boolean isProspective(Hypercube hi, Hypercube hk, int col) {
		return Math.abs(hi.getCoordAt(col) - hk.getCoordAt(col)) <= 1;
	}

}
