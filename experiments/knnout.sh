benchmark() {
    for i in `seq 1 10`; do echo knnout_parkinson_$i;   java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/parkinson.csv -parser.labelIndices 22 -algorithm outlier.distance.KNNOutlier -knno.k 4     > "bench/knnout_parkinson_$i.log";   done
    for i in `seq 1 10`; do echo knnout_hepatitis_$i;   java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/hepatitis.csv -parser.labelIndices 20 -algorithm outlier.distance.KNNOutlier -knno.k 11    > "bench/knnout_hepatitis_$i.log";   done
    for i in `seq 1 10`; do echo knnout_glass_$i;       java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/glass.csv -parser.labelIndices 9 -algorithm outlier.distance.KNNOutlier -knno.k 1          > "bench/knnout_glass_$i.log";       done
    for i in `seq 1 10`; do echo knnout_ecoli_$i;       java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/ecoli.csv -parser.labelIndices 7 -algorithm outlier.distance.KNNOutlier -knno.k 50         > "bench/knnout_ecoli_$i.log";       done
    for i in `seq 1 10`; do echo knnout_ionosphere_$i;  java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/ionosphere.csv -parser.labelIndices 33 -algorithm outlier.distance.KNNOutlier -knno.k 4    > "bench/knnout_ionosphere_$i.log";  done
    for i in `seq 1 10`; do echo knnout_breastw_$i;     java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/breastw.csv -parser.labelIndices 9 -algorithm outlier.distance.KNNOutlier -knno.k 2        > "bench/knnout_breastw_$i.log";     done
    for i in `seq 1 10`; do echo knnout_pima_$i;        java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/pima.csv -parser.labelIndices 8 -algorithm outlier.distance.KNNOutlier -knno.k 413         > "bench/knnout_pima_$i.log";        done
    for i in `seq 1 10`; do echo knnout_thyroid_$i;     java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/thyroid.csv -parser.labelIndices 6 -algorithm outlier.distance.KNNOutlier -knno.k 3        > "bench/knnout_thyroid_$i.log";     done
    for i in `seq 1 10`; do echo knnout_satimage-2_$i;  java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/satimage-2.csv -parser.labelIndices 36 -algorithm outlier.distance.KNNOutlier -knno.k 30   > "bench/knnout_satimage-2_$i.log";  done
    for i in `seq 1 10`; do echo knnout_mammography_$i; java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/mammography.csv -parser.labelIndices 6 -algorithm outlier.distance.KNNOutlier -knno.k 1590 > "bench/knnout_mammography_$i.log"; done
    for i in `seq 1 10`; do echo knnout_shuttle_$i;     java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/shuttle.csv -parser.labelIndices 9 -algorithm outlier.distance.KNNOutlier -knno.k 2600     > "bench/knnout_shuttle_$i.log";     done
    for i in `seq 1 10`; do echo knnout_http_$i;        java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/http.csv -parser.labelIndices 3 -algorithm outlier.distance.KNNOutlier -knno.k 3000        > "bench/knnout_http_$i.log";        done
}

search() {
    for k in `seq 1 50`; do
      echo "knnout_parkinson_k=${k}"
      java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
      -dbc.in ../datasets/parkinson.csv -parser.labelIndices 22 \
      -algorithm outlier.distance.KNNOutlier -knno.k $k \
      > "params/knnout_parkinson_k=${k}.csv"
    done

    for k in `seq 1 50`; do
      echo "knnout_hepatitis_k=${k}"
      java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
      -dbc.in ../datasets/hepatitis.csv -parser.labelIndices 20 \
      -algorithm outlier.distance.KNNOutlier -knno.k $k \
      > "params/knnout_hepatitis_k=${k}.csv"
    done


    for k in `seq 1 20`; do
      echo "knnout_glass_k=${k}"
      java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
      -dbc.in ../datasets/glass.csv -parser.labelIndices 9 \
      -algorithm outlier.distance.KNNOutlier -knno.k $k \
      > "params/knnout_glass_k=${k}.csv"
    done

    for k in `seq 1 100`; do
      echo "knnout_ecoli_k=${k}"
      java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
      -dbc.in ../datasets/ecoli.csv -parser.labelIndices 7 \
      -algorithm outlier.distance.KNNOutlier -knno.k $k \
      > "params/knnout_ecoli_k=${k}.csv"
    done

    for k in `seq 1 50`; do
      echo "knnout_ionosphere_k=${k}"
      java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
      -dbc.in ../datasets/ionosphere.csv -parser.labelIndices 33 \
      -algorithm outlier.distance.KNNOutlier -knno.k $k \
      > "params/knnout_ionosphere_k=${k}.csv"
    done

    for k in `seq 1 50`; do
      echo "knnout_breastw_k=${k}"
      java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
      -dbc.in ../datasets/breastw.csv -parser.labelIndices 9 \
      -algorithm outlier.distance.KNNOutlier -knno.k $k \
      > "params/knnout_breastw_k=${k}.csv"
    done

    for k in `seq 100 500`; do
      echo "knnout_pima_k=${k}"
      java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
      -dbc.in ../datasets/pima.csv -parser.labelIndices 8 \
      -algorithm outlier.distance.KNNOutlier -knno.k $k \
      > "params/knnout_pima_k=${k}.csv"
    done

    for k in `seq 1 50`; do
      echo "knnout_thyroid_k=${k}"
      java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
      -dbc.in ../datasets/thyroid.csv -parser.labelIndices 6 \
      -algorithm outlier.distance.KNNOutlier -knno.k $k \
      > "params/knnout_thyroid_k=${k}.csv"
    done

    for k in `seq 1 100`; do
      echo "knnout_satimage-2_k=${k}"
      java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
      -dbc.in ../datasets/satimage-2.csv -parser.labelIndices 36 \
      -algorithm outlier.distance.KNNOutlier -knno.k $k \
      > "params/knnout_satimage-2_k=${k}.csv"
    done

    for k in `seq 100 10 2500`; do
      echo "knnout_mammography_k=${k}"
      java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
      -dbc.in ../datasets/mammography.csv -parser.labelIndices 6 \
      -algorithm outlier.distance.KNNOutlier -knno.k $k \
      > "params/knnout_mammography_k=${k}.csv"
    done

    for k in `seq 2000 100 5000`; do
      echo "knnout_shuttle_k=${k}"
      java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
      -dbc.in ../datasets/shuttle.csv -parser.labelIndices 9 \
      -algorithm outlier.distance.KNNOutlier -knno.k $k \
      > "params/knnout_shuttle_k=${k}.csv"
    done

    for k in `seq 2000 100 4000`; do
      echo "knnout_http_k=${k}"
      java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
      -dbc.in ../datasets/http.csv -parser.labelIndices 3 \
      -algorithm outlier.distance.KNNOutlier -knno.k $k \
      > "params/knnout_http_k=${k}.csv"
    done
}

case "$1" in
    -b) benchmark ;;
    -s) search ;;
    *)  echo "Usage: ./script.sh [-b | -s]" ;;
esac
