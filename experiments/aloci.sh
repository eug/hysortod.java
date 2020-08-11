benchmark() {
	for i in `seq 1 10`; do echo aloci_parkinson_$i;   java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/parkinson.csv -parser.labelIndices 22 -algorithm outlier.lof.ALOCI -loci.nmin 1 -loci.g 1 -loci.seed 42  > "bench/aloci_parkinson_$i.log";   done
	for i in `seq 1 10`; do echo aloci_hepatitis_$i;   java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/hepatitis.csv -parser.labelIndices 20 -algorithm outlier.lof.ALOCI -loci.nmin 1 -loci.g 1 -loci.seed 42  > "bench/aloci_hepatitis_$i.log";   done
	for i in `seq 1 10`; do echo aloci_glass_$i;       java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/glass.csv -parser.labelIndices 9 -algorithm outlier.lof.ALOCI -loci.nmin 120 -loci.g 2 -loci.seed 42     > "bench/aloci_glass_$i.log";       done
	for i in `seq 1 10`; do echo aloci_ecoli_$i;       java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/ecoli.csv -parser.labelIndices 7 -algorithm outlier.lof.ALOCI -loci.nmin 50 -loci.g 1 -loci.seed 42      > "bench/aloci_ecoli_$i.log";       done
	for i in `seq 1 10`; do echo aloci_ionosphere_$i;  java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/ionosphere.csv -parser.labelIndices 33 -algorithm outlier.lof.ALOCI -loci.nmin 1 -loci.g 1 -loci.seed 42 > "bench/aloci_ionosphere_$i.log";  done
	for i in `seq 1 10`; do echo aloci_breastw_$i;     java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/breastw.csv -parser.labelIndices 9 -algorithm outlier.lof.ALOCI -loci.nmin 3 -loci.g 4 -loci.seed 42     > "bench/aloci_breastw_$i.log";     done
	for i in `seq 1 10`; do echo aloci_pima_$i;        java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/pima.csv -parser.labelIndices 8 -algorithm outlier.lof.ALOCI -loci.nmin 70 -loci.g 1 -loci.seed 42       > "bench/aloci_pima_$i.log";        done
	for i in `seq 1 10`; do echo aloci_thyroid_$i;     java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/thyroid.csv -parser.labelIndices 6 -algorithm outlier.lof.ALOCI -loci.nmin 17 -loci.g 1 -loci.seed 42    > "bench/aloci_thyroid_$i.log";     done
	for i in `seq 1 10`; do echo aloci_satimage-2_$i;  java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/satimage-2.csv -parser.labelIndices 36 -algorithm outlier.lof.ALOCI -loci.nmin 1 -loci.g 1 -loci.seed 42 > "bench/aloci_satimage-2_$i.log";  done
	for i in `seq 1 10`; do echo aloci_mammography_$i; java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/mammography.csv -parser.labelIndices 6 -algorithm outlier.lof.ALOCI -loci.nmin 3 -loci.g 1 -loci.seed 42 > "bench/aloci_mammography_$i.log"; done
	for i in `seq 1 10`; do echo aloci_shuttle_$i;     java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/shuttle.csv -parser.labelIndices 9 -algorithm outlier.lof.ALOCI -loci.nmin 1700 -loci.g 1 -loci.seed 42  > "bench/aloci_shuttle_$i.log";     done
	# for i in `seq 1 10`; do echo aloci_http_$i;        java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/http.csv -parser.labelIndices 3 -algorithm outlier.lof.ALOCI -loci.nmin ? -loci.g ? -loci.seed 42        > "bench/aloci_http_$i.log";        done	
}

search() {
	for g in `seq 1 4`; do
		for n in `seq 1 10`; do
			echo "aloci_parkinson_n=${n}_g=${g}"
			java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
			-dbc.in ../datasets/parkinson.csv -parser.labelIndices 22 \
			-algorithm outlier.lof.ALOCI -loci.nmin $n -loci.g $g -loci.seed 42 \
			> "params/aloci_parkinson_n=${n}_g=${g}.csv"
		done
	done

	for g in `seq 1 4`; do
		for n in `seq 1 10`; do
			echo "aloci_hepatitis_n=${n}_g=${g}"
			java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
			-dbc.in ../datasets/hepatitis.csv -parser.labelIndices 20 \
			-algorithm outlier.lof.ALOCI -loci.nmin $n -loci.g $g -loci.seed 42 \
			> "params/aloci_hepatitis_n=${n}_g=${g}.csv"
		done
	done

	for g in `seq 1 4`; do
		for n in `seq 1 200`; do
			echo "aloci_glass_n=${n}_g=${g}"
			java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
			-dbc.in ../datasets/glass.csv -parser.labelIndices 9 \
			-algorithm outlier.lof.ALOCI -loci.nmin $n -loci.g $g -loci.seed 42 \
			> "params/aloci_glass_n=${n}_g=${g}.csv"
		done
	done

	for g in `seq 1 4`; do
		for n in `seq 1 100`; do
			echo "aloci_ecoli_n=${n}_g=${g}"
			java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
			-dbc.in ../datasets/ecoli.csv -parser.labelIndices 7 \
			-algorithm outlier.lof.ALOCI -loci.nmin $n -loci.g $g -loci.seed 42 \
			> "params/aloci_ecoli_n=${n}_g=${g}.csv"
		done
	done

	for g in `seq 1 4`; do
		for n in `seq 1 50`; do
			echo "aloci_ionosphere_n=${n}_g=${g}"
			java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
			-dbc.in ../datasets/ionosphere.csv -parser.labelIndices 33 \
			-algorithm outlier.lof.ALOCI -loci.nmin $n -loci.g $g -loci.seed 42 \
			> "params/aloci_ionosphere_n=${n}_g=${g}.csv"
		done
	done

	for g in `seq 1 4`; do
		for n in `seq 1 10`; do
			echo "aloci_breastw_n=${n}_g=${g}"
			java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
			-dbc.in ../datasets/breastw.csv -parser.labelIndices 9 \
			-algorithm outlier.lof.ALOCI -loci.nmin $n -loci.g $g -loci.seed 42 \
			> "params/aloci_breastw_n=${n}_g=${g}.csv"
		done
	done

	for g in `seq 1 4`; do
		for n in `seq 1 100`; do
			echo "aloci_pima_n=${n}_g=${g}"
			java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
			-dbc.in ../datasets/pima.csv -parser.labelIndices 8 \
			-algorithm outlier.lof.ALOCI -loci.nmin $n -loci.g $g -loci.seed 42 \
			> "params/aloci_pima_n=${n}_g=${g}.csv"
		done
	done


	for g in `seq 1 4`; do
		for n in `seq 1 50`; do
			echo "aloci_thyroid_n=${n}_g=${g}"
			java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
			-dbc.in ../datasets/thyroid.csv -parser.labelIndices 6 \
			-algorithm outlier.lof.ALOCI -loci.nmin $n -loci.g $g -loci.seed 42 \
			> "params/aloci_thyroid_n=${n}_g=${g}.csv"
		done
	done

	for g in `seq 1 4`; do
		for n in `seq 1 100`; do
			echo "aloci_satimage2_n=${n}_g=${g}"
			java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
			-dbc.in ../datasets/satimage-2.csv -parser.labelIndices 36 \
			-algorithm outlier.lof.ALOCI -loci.nmin $n -loci.g $g -loci.seed 42 \
			> "params/aloci_satimage2_n=${n}_g=${g}.csv"
		done
	done

	for g in `seq 1 4`; do
		for n in `seq 1 10`; do
			echo "aloci_mammography_n=${n}_g=${g}"
			java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
			-dbc.in ../datasets/mammography.csv -parser.labelIndices 6 \
			-algorithm outlier.lof.ALOCI -loci.nmin $n -loci.g $g -loci.seed 42 \
			> "params/aloci_mammography_n=${n}_g=${g}.csv"
		done
	done

	for g in `seq 1 4`; do
		for n in `seq 0 100 3000`; do
			echo "aloci_shuttle_n=${n}_g=${g}"
			java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
			-dbc.in ../datasets/shuttle.csv -parser.labelIndices 9 \
			-algorithm outlier.lof.ALOCI -loci.nmin $n -loci.g $g -loci.seed 42 \
			> "params/aloci_shuttle_n=${n}_g=${g}.csv"
		done
	done

	# for g in `seq 1 4`; do
	# 	for n in `seq 0 100 5000`; do
	# 		echo "aloci_http_n=${n}_g=${g}"
	#		java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
	#		-dbc.in ../datasets/http.csv -parser.labelIndices 3 \
	# 		-algorithm outlier.lof.ALOCI -loci.nmin $n -loci.g $g -loci.seed 42 \
	# 		> "params/aloci_http_n=${n}_g=${g}.csv"
	# 	done
	# done
}

case "$1" in
    -b) benchmark ;;
    -s) search ;;
    *)  echo "Usage: ./script.sh [-b | -s]" ;;
esac
