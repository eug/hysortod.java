import common.AUC;
import common.Table;
import common.search.NaiveStrategy;
import common.search.TreeStrategy;
import outlier.HySortOD;

public class Benchmark {

	public static void main(String[] args) {

		Table[] datasets = {
			Table.readCSV("datasets/parkinson.csv", ",", 22, true),
			Table.readCSV("datasets/hepatitis.csv", ",", 20, true),
			Table.readCSV("datasets/glass.csv", ",", 9, true),
			Table.readCSV("datasets/ecoli.csv", ",", 7, true),
			Table.readCSV("datasets/ionosphere.csv", ",", 33, true),
			Table.readCSV("datasets/breastw.csv", ",", 9, true),
			Table.readCSV("datasets/pima.csv", ",", 8, true),
			Table.readCSV("datasets/thyroid.csv", ",", 6, true),
			Table.readCSV("datasets/satimage-2.csv", ",", 36, true),
			Table.readCSV("datasets/mammography.csv", ",", 6, true),
			Table.readCSV("datasets/shuttle.csv", ",", 9, true),
			Table.readCSV("datasets/http.csv", ",", 3, true),
//			Table.readCSV("datasets/kddcup08.csv", ",", 117, true)
		};
		

		for(Table dataset : datasets) {
			for (int b = 5; b <= 5; b++) {
				double score;
				long start, end, runtime;
				double[] yPred;
				int[] yTrue = dataset.getLabels();
				
				start = System.currentTimeMillis();
//				HySortOD hsodIndexed = new HySortOD(b, new NaiveMapper());
				HySortOD hsodIndexed = new HySortOD(b, new TreeStrategy(100));
				yPred = hsodIndexed.score(dataset);
				score = AUC.measure(yTrue, yPred);

				end = System.currentTimeMillis();
				runtime = end - start;
				
				message(dataset.getName(), dataset.getNumRows(), b, score, runtime, true);
			}
		}
	}
	
	private static void message(String dataset, int numRows, int b, double score, long runtime, boolean isMapped) {
		String outputFormat= "%-15s\tn=%d\tb=%d\tAUC=%.4f\tRuntime=%d\tindexed=%s";
		String outputString = String.format(outputFormat, dataset, numRows, b, score, runtime, isMapped);
		System.out.println(outputString);
	}
}
