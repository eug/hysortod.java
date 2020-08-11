benchmark() {
	for i in `seq 1 10`; do echo abod_parkinson_$i;  java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/parkinson.csv -parser.labelIndices 22 -algorithm outlier.anglebased.ABOD  > bench/abod_parkinson_$i.log;   done
	for i in `seq 1 10`; do echo abod_hepatitis_$i;  java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/hepatitis.csv -parser.labelIndices 20 -algorithm outlier.anglebased.ABOD  > bench/abod_hepatitis_$i.log;   done
	for i in `seq 1 10`; do echo abod_glass_$i;      java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/glass.csv -parser.labelIndices 9 -algorithm outlier.anglebased.ABOD       > bench/abod_glass_$i.log;       done
	for i in `seq 1 10`; do echo abod_ecoli_$i;      java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/ecoli.csv -parser.labelIndices 7 -algorithm outlier.anglebased.ABOD       > bench/abod_ecoli_$i.log;       done
	for i in `seq 1 10`; do echo abod_ionosphere_$i; java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/ionosphere.csv -parser.labelIndices 33 -algorithm outlier.anglebased.ABOD > bench/abod_ionosphere_$i.log;  done
	for i in `seq 1 10`; do echo abod_breastw_$i;    java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/breastw.csv -parser.labelIndices 9 -algorithm outlier.anglebased.ABOD     > bench/abod_breastw_$i.log;     done
	for i in `seq 1 10`; do echo abod_pima_$i;       java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/pima.csv -parser.labelIndices 8 -algorithm outlier.anglebased.ABOD        > bench/abod_pima_$i.log;        done
	for i in `seq 1 10`; do echo abod_thyroid_$i;    java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/thyroid.csv -parser.labelIndices 6 -algorithm outlier.anglebased.ABOD     > bench/abod_thyroid_$i.log;     done
	for i in `seq 1 10`; do echo abod_satimage-2_$i; java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/satimage-2.csv -parser.labelIndices 36 -algorithm outlier.anglebased.ABOD > bench/abod_satimage-2_$i.log;  done
	for i in `seq 1 10`; do echo abod_mammography_$i;java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/mammography.csv -parser.labelIndices 6 -algorithm outlier.anglebased.ABOD > bench/abod_mammography_$i.log; done
	# for i in `seq 1 10`; do echo abod_shuttle_$i;    java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/shuttle.csv -parser.labelIndices 9 -algorithm outlier.anglebased.ABOD         > bench/abod_shuttle_$i.log;     done
	# for i in `seq 1 10`; do echo abod_http_$i;       java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/http.csv -parser.labelIndices 3 -algorithm outlier.anglebased.ABOD               > bench/abod_http_$i.log;        done	
}


# search() {} # ABOD is parameter-free


case "$1" in
    -b) benchmark ;;
    -s) search ;;
    *)  echo "Usage: ./script.sh [-b | -s]" ;;
esac


