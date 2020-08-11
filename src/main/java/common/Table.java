package common;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.stream.Stream;

import org.apache.commons.lang3.StringUtils;


public class Table implements Cloneable {

	private String name;
	private final int numRows;
	private final int numCols;
	private final Instance[] instances;
	private boolean hasLabel;
	private boolean isNormalized;
	
	public Table(int numRows, int numCols, Instance[] instances, String name, boolean hasLabel) {
		this.name = name;
		this.numRows = numRows;
		this.numCols = numCols;
		this.instances = instances;
		this.hasLabel = true;
		this.isNormalized = false;
	}
	
	public static Table readCSV(String filename) {
		return readCSV(filename, ",");
	}
	
	public static Table readCSV(String filename, String sep) {
		return readCSV(filename, sep, -1, false);
	}
	
	public static Table readCSV(String filename, String sep, int labelCol, boolean hasHeader) {
		int nRows = getNumRows(filename);
		int nCols = getNumCols(filename, sep);
		int nDataCols = nCols;
		boolean hasLabel = false;
		
		if (hasHeader)
			nRows -= 1;
		
		if (labelCol >= 0) {
			hasLabel = true;
			nDataCols -= 1;
		}

		Instance[] instances = new Instance[nRows];
		
		try (BufferedReader bf = new BufferedReader(new FileReader(filename))) {
			String line;
			String[] v;
			int label = -1;
			
			if (hasHeader)
				bf.readLine(); // skip header
			
			for (int i = 0; (line = bf.readLine()) != null; i++) {
				v = line.split(sep);
				double[] values = new double[nDataCols];

				for (int j = 0; j < v.length; j++) {
					if (j == labelCol) {
						label = Integer.parseInt(v[j]);
					} else {						
						values[j] = Double.parseDouble(v[j]);
					}
				}
				
				instances[i] = new Instance(i, values, label);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return new Table(nRows, nDataCols, instances, getName(filename), hasLabel);
	}
	
	private static String getName(String filename) {
		String basename = Paths.get(filename).getFileName().toString();
		return basename.substring(0, basename.lastIndexOf("."));
	}
	
	private static int getNumCols(String filename, String sep) {
		try {
			Stream<String> stream = Files.lines(Paths.get(filename));
			String header = stream.iterator().next();
			stream.close();
			return (int) StringUtils.countMatches(header, sep) + 1;
		} catch (IOException e) {
			return 0;
		}
	}
	
	private static int getNumRows(String filename) {
		try {
			Path path = Paths.get(filename);
			return (int) Files.lines(path).count();
		} catch (IOException e) {
			return 0;
		}
	}
	
	public void normalize() {
		assert numRows > 0;
		assert numCols > 0;
		assert Objects.nonNull(instances);
		
		for (int j = 0; j < numCols; j++) {
			double minVal = Double.MAX_VALUE;
			double maxVal = Double.MIN_VALUE;
			for (int i = 0; i < numRows; i++) {
				minVal = Math.min(instances[i].getAt(j), minVal);
				maxVal = Math.max(instances[i].getAt(j), maxVal);
			}
			for (int i = 0; i < numRows; i++) {
				double value = (instances[i].getAt(j) - minVal) / (maxVal - minVal);
				instances[i].setAt(j, value); 
			}
		}

		isNormalized = true;
	}
	
	public boolean isNormalized() {
		return isNormalized;
	}
	
	public Instance getInstance(int i) {
		return instances[i];
	}
	
	public double getAt(int i, int j) {
		return instances[i].getAt(j);
	}
	
	public List<Instance> asList() {
		return Arrays.asList(this.instances);
	}
	
	public int[] getLabels() {
		int[] labels = new int[numRows];
		for (int i = 0; i < numRows; i++) {
			labels[i] = getInstance(i).getLabel();
		}
		return labels;
	}
	
	public int getNumRows() {
		return numRows;
	}
	
	public int getNumCols() {
		return numCols;
	}
	
	public String getName() {
		return name;
	}
	
	public boolean hasLabel() {
		return hasLabel;
	}
	
	@Override
	public Table clone() {
		int id, lbl;
		double[] vals;
		Instance[] instances = new Instance[numRows];
		
		for (int i = 0; i < numRows; i++) {
			id = this.instances[i].getId();
			vals = this.instances[i].getValues();
			lbl = this.instances[i].getLabel();
			instances[i] = new Instance(id, vals, lbl);
		}
			
		return new Table(numRows, numCols, instances, name, hasLabel);
	}
}
