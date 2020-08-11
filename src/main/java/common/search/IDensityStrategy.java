package common.search;

import common.Hypercube;

public interface IDensityStrategy {
	public IDensityStrategy buildIndex(Hypercube[] H);
	public int[] getDensities();
	public double getMaxDensity();
}
