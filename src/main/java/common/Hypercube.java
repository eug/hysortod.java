package common;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Objects;

public class Hypercube implements Comparable<Hypercube>, Comparator<Hypercube> {
	
	private int[] coords;
	private ArrayList<Instance> instances;

	public Hypercube(double[] values, double length) {
		this.coords = new int[values.length];
		this.instances = new ArrayList<>();
		
		for (int j = 0; j < values.length; j++)
			coords[j] = (int) Math.floor(values[j] / length);
	}

	@Override
	public int compare(Hypercube o1, Hypercube o2) {
		for (int i = 0; i < o1.coords.length; i++) {
			int d = o1.coords[i] - o2.coords[i];					
			if (d != 0)
				return d;
		}
		return 0;
	}

	@Override
	public int compareTo(Hypercube o) {
		for (int i = 0; i < coords.length; i++) {
			int d = coords[i] - o.coords[i];					
			if (d != 0)
				return d;
		}
		return 0;
	}

	@Override
	public boolean equals(Object obj) {
		if (Objects.isNull(obj))
			return false;
		
		if (getClass() != obj.getClass())
			return false;
		
		final Hypercube other = (Hypercube) obj; 
		
		if (coords.length != other.coords.length) 
			return false;
		
		for (int i = 0; i < coords.length; i++)
			if (coords[i] != other.coords[i])
				return false;
		
		return true;
	}

	@Override
	public String toString() {
		StringBuilder str = new StringBuilder();
		str.append("(" + coords[0]);
		for(int i = 1; i < coords.length; i++)
			str.append(", " + coords[i]);
		str.append(")");
		return str.toString();
	}

	public int getCoordAt(int j) {
		return coords[j];
	}
	
	public int[] getCoords() {
		return coords;
	}
	
	public int getNumDimensions() {
		return coords.length;
	}

	public List<Instance> getInstances() {
		return instances;
	}
	
	public void add(Instance instance) {
		instances.add(instance);
	}
	
	public int getDensity() {
		return instances.size();
	}

}
