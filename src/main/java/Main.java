import common.AUC;
import common.Table;
import common.search.IDensityStrategy;
import common.search.NaiveStrategy;
import common.search.TreeStrategy;
import outlier.HySortOD;

public class Main {

	public static void main(String[] args) {
		
		if (args.length != 5) {
			System.out.println("Parameters: dataset_path label_column num_bins min_split report_output");
			System.out.println("dataset_path is string to dataset path.");
			System.out.println("label_column = -1 means no label.");
			System.out.println("num_bins must be greater than 1.");
			System.out.println("min_split = 0 enables naive search.");
			System.out.println("report_output is 0 or 1");
			System.exit(1);
		}
		
		// read parameters
		String filename = args[0];
		int labelCol = Integer.valueOf(args[1]); // -1 means no label
		int b = Integer.valueOf(args[2]); // Must be greater than 1
		int minSplit = Integer.valueOf(args[3]);
		boolean reportOutput = Integer.valueOf(args[4]) == 1;

		// check parameters
		if (b <= 1) {
			System.out.println("Number invalid for parameter bins, reason: b <= 1");
			System.exit(1);
		}
		
		if (minSplit < 0) {
			System.out.println("Number invalid for parameter min_split, reason: min_split < 0");
			System.exit(1);			
		}
		
		// instantiate the specified mapper
		IDensityStrategy strategy = new NaiveStrategy();
		if (minSplit > 0) {
			strategy = new TreeStrategy(minSplit);
			System.out.println("[INFO] Using Tree-based search");
		} else {
			System.out.println("[INFO] Using naive search");
		}
		
		// read dataset
		Table dataset = Table.readCSV(filename, ",", labelCol, true);
		
		// run the algorithm and compute runtime
		long start = System.currentTimeMillis();
		HySortOD hsod = new HySortOD(b, strategy);		
		double[] yPred = hsod.score(dataset);
		long end = System.currentTimeMillis();
		
		double time = (end - start) / 1000.0;
		System.out.println(String.format("runtime: %.8f", time));
		
		// calculate the auc score if possible
		if (dataset.hasLabel()) {
			int[] yTrue = dataset.getLabels();
			double auc = AUC.measure(yTrue, yPred);
			System.out.println(String.format("rocauc : %.8f", auc));
		}
		

		// report the outlierness score for each instance if specified
		if (reportOutput) {
			if (dataset.hasLabel()) {
				int[] yTrue = dataset.getLabels();
				for (int i = 0; i < yTrue.length; i++) {
					System.out.println(String.format("%d,%.4f", yTrue[i], yPred[i]));
				}
			} else {
				for (int i = 0; i < yPred.length; i++) {
					System.out.println(String.format("%.4f", yPred[i]));
				}
			}
		}
		
	}

}
