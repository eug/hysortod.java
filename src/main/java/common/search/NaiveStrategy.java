package common.search;

import common.Hypercube;

public class NaiveStrategy extends AbstractDensityStrategy {

	@Override
	public IDensityStrategy buildIndex(Hypercube[] H) {
		this.H = H;
		this.Wmax = 0;
		return this;
	}
	
	@Override
	public int[] getDensities() {
		int n = H.length;
		int[] W = new int[n];

		for (int i = 0; i < n; i++) {
			
			W[i] = H[i].getDensity();
			
			for (int k = i - 1; k >= 0; k--) {
				if (!isProspective(H[i], H[k], 0))
					break;
				if (isImmediate(H[i], H[k]))
					W[i] += H[k].getDensity();
			}
			
			for (int k = i + 1; k < n; k++) {
				if (!isProspective(H[i], H[k], 0))
					break;
				if (isImmediate(H[i], H[k]))
					W[i] += H[k].getDensity();
			}
			
			Wmax = Math.max(Wmax, W[i]);
		}
		
		return W;
	}
	
}
