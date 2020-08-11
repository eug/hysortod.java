benchmark() {

	for i in `seq 1 10`; do echo hysortod_parkinson_$i;  java -jar hysortod-0.0.1-SNAPSHOT.jar ../datasets/odds/Parkinson/parkinson.csv 22 5 100 0 > bench/hysortod_default_parkinson_$i.log;   done
	for i in `seq 1 10`; do echo hysortod_hepatitis_$i;  java -jar hysortod-0.0.1-SNAPSHOT.jar ../datasets/odds/Hepatitis/hepatitis.csv 20 5 100 0 > bench/hysortod_default_hepatitis_$i.log;   done
	for i in `seq 1 10`; do echo hysortod_glass_$i;      java -jar hysortod-0.0.1-SNAPSHOT.jar ../datasets/odds/Glass/glass.csv 9 5 100 0 > bench/hysortod_default_glass_$i.log;       done
	for i in `seq 1 10`; do echo hysortod_ecoli_$i;      java -jar hysortod-0.0.1-SNAPSHOT.jar ../datasets/odds/Ecoli/ecoli.csv 7 5 100 0 > bench/hysortod_default_ecoli_$i.log;       done
	for i in `seq 1 10`; do echo hysortod_ionosphere_$i; java -jar hysortod-0.0.1-SNAPSHOT.jar ../datasets/odds/Ionosphere/ionosphere.csv 33 5 100 0 > bench/hysortod_default_ionosphere_$i.log;  done
	for i in `seq 1 10`; do echo hysortod_breastw_$i;    java -jar hysortod-0.0.1-SNAPSHOT.jar ../datasets/odds/BreastW/breastw.csv 9 5 100 0 > bench/hysortod_default_breastw_$i.log;     done
	for i in `seq 1 10`; do echo hysortod_pima_$i;       java -jar hysortod-0.0.1-SNAPSHOT.jar ../datasets/odds/Pima/pima.csv 8 5 100 0 > bench/hysortod_default_pima_$i.log;        done
	for i in `seq 1 10`; do echo hysortod_thyroid_$i;    java -jar hysortod-0.0.1-SNAPSHOT.jar ../datasets/odds/Thyroid/thyroid.csv 6 5 100 0 > bench/hysortod_default_thyroid_$i.log;     done
	for i in `seq 1 10`; do echo hysortod_satimage-2_$i; java -jar hysortod-0.0.1-SNAPSHOT.jar ../datasets/odds/SatImage2/satimage-2.csv 36 5 100 0 > bench/hysortod_default_satimage-2_$i.log;  done
	for i in `seq 1 10`; do echo hysortod_mammography_$i;java -jar hysortod-0.0.1-SNAPSHOT.jar ../datasets/odds/Mammography/mammography.csv 6 5 100 0 > bench/hysortod_default_mammography_$i.log; done
	for i in `seq 1 10`; do echo hysortod_shuttle_$i;    java -jar hysortod-0.0.1-SNAPSHOT.jar ../datasets/odds/Shuttle/shuttle.csv 9 5 100 0 > bench/hysortod_default_shuttle_$i.log;     done
	for i in `seq 1 10`; do echo hysortod_http_$i;       java -jar hysortod-0.0.1-SNAPSHOT.jar ../datasets/odds/Http/http.csv 3 5 100 0 > bench/hysortod_default_http_$i.log;        done

	for i in `seq 1 10`; do echo hysortod_parkinson_$i;  java -jar hysortod-0.0.1-SNAPSHOT.jar ../datasets/odds/Parkinson/parkinson.csv 22 4 100 0 > bench/hysortod_best_parkinson_$i.log;   done
	for i in `seq 1 10`; do echo hysortod_hepatitis_$i;  java -jar hysortod-0.0.1-SNAPSHOT.jar ../datasets/odds/Hepatitis/hepatitis.csv 20 2 100 0 > bench/hysortod_best_hepatitis_$i.log;   done
	for i in `seq 1 10`; do echo hysortod_glass_$i;      java -jar hysortod-0.0.1-SNAPSHOT.jar ../datasets/odds/Glass/glass.csv 9 28 100 0 > bench/hysortod_best_glass_$i.log;       done
	for i in `seq 1 10`; do echo hysortod_ecoli_$i;      java -jar hysortod-0.0.1-SNAPSHOT.jar ../datasets/odds/Ecoli/ecoli.csv 7 4 100 0 > bench/hysortod_best_ecoli_$i.log;       done
	for i in `seq 1 10`; do echo hysortod_ionosphere_$i; java -jar hysortod-0.0.1-SNAPSHOT.jar ../datasets/odds/Ionosphere/ionosphere.csv 33 4 100 0 > bench/hysortod_best_ionosphere_$i.log;  done
	for i in `seq 1 10`; do echo hysortod_breastw_$i;    java -jar hysortod-0.0.1-SNAPSHOT.jar ../datasets/odds/BreastW/breastw.csv 9 6 100 0 > bench/hysortod_best_breastw_$i.log;     done
	for i in `seq 1 10`; do echo hysortod_pima_$i;       java -jar hysortod-0.0.1-SNAPSHOT.jar ../datasets/odds/Pima/pima.csv 8 7 100 0 > bench/hysortod_best_pima_$i.log;        done
	for i in `seq 1 10`; do echo hysortod_thyroid_$i;    java -jar hysortod-0.0.1-SNAPSHOT.jar ../datasets/odds/Thyroid/thyroid.csv 6 31 100 0 > bench/hysortod_best_thyroid_$i.log;     done
	for i in `seq 1 10`; do echo hysortod_satimage-2_$i; java -jar hysortod-0.0.1-SNAPSHOT.jar ../datasets/odds/SatImage2/satimage-2.csv 36 3 100 0 > bench/hysortod_best_satimage-2_$i.log;  done
	for i in `seq 1 10`; do echo hysortod_mammography_$i;java -jar hysortod-0.0.1-SNAPSHOT.jar ../datasets/odds/Mammography/mammography.csv 6 39 100 0 > bench/hysortod_best_mammography_$i.log; done
	for i in `seq 1 10`; do echo hysortod_shuttle_$i;    java -jar hysortod-0.0.1-SNAPSHOT.jar ../datasets/odds/Shuttle/shuttle.csv 9 11 100 0 > bench/hysortod_best_shuttle_$i.log;     done
	for i in `seq 1 10`; do echo hysortod_http_$i;       java -jar hysortod-0.0.1-SNAPSHOT.jar ../datasets/odds/Http/http.csv 3 8 100 0 > bench/hysortod_best_http_$i.log;        done

	#for i in `seq 1 10`; do echo hysortod_kddcup08_$i;   java -jar hysortod-0.0.1-SNAPSHOT.jar ../datasets/kdd08/kddcup08.csv 117 5 100 > bench/hysortod_tree_default_kddcup08_$i.log; done
	#for i in `seq 1 10`; do echo hysortod_kddcup08_$i;   java -jar hysortod-0.0.1-SNAPSHOT.jar ../datasets/kdd08/kddcup08.csv 117 7 100 > bench/hysortod_tree_best_kddcup08_$i.log; done
}


# search() { }


case "$1" in
    -b) benchmark ;;
    -s) search ;;
    *)  echo "Usage: ./script.sh [-b | -s]" ;;
esac
