benchmark() {
    for i in `seq 1 10`; do echo lof_parkinson_$i;   java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/parkinson.csv -parser.labelIndices 22 -algorithm outlier.lof.LOF -lof.k 6    > "bench/lof_parkinson_$i.log";   done
    for i in `seq 1 10`; do echo lof_hepatitis_$i;   java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/hepatitis.csv -parser.labelIndices 20 -algorithm outlier.lof.LOF -lof.k 10   > "bench/lof_hepatitis_$i.log";   done
    for i in `seq 1 10`; do echo lof_glass_$i;       java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/glass.csv -parser.labelIndices 9 -algorithm outlier.lof.LOF -lof.k 2         > "bench/lof_glass_$i.log";       done
    for i in `seq 1 10`; do echo lof_ecoli_$i;       java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/ecoli.csv -parser.labelIndices 7 -algorithm outlier.lof.LOF -lof.k 1         > "bench/lof_ecoli_$i.log";       done
    for i in `seq 1 10`; do echo lof_ionosphere_$i;  java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/ionosphere.csv -parser.labelIndices 33 -algorithm outlier.lof.LOF -lof.k 6   > "bench/lof_ionosphere_$i.log";  done
    for i in `seq 1 10`; do echo lof_breastw_$i;     java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/breastw.csv -parser.labelIndices 9 -algorithm outlier.lof.LOF -lof.k 1       > "bench/lof_breastw_$i.log";     done
    for i in `seq 1 10`; do echo lof_pima_$i;        java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/pima.csv -parser.labelIndices 8 -algorithm outlier.lof.LOF -lof.k 408        > "bench/lof_pima_$i.log";        done
    for i in `seq 1 10`; do echo lof_thyroid_$i;     java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/thyroid.csv -parser.labelIndices 6 -algorithm outlier.lof.LOF -lof.k 100     > "bench/lof_thyroid_$i.log";     done
    for i in `seq 1 10`; do echo lof_satimage-2_$i;  java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/satimage-2.csv -parser.labelIndices 36 -algorithm outlier.lof.LOF -lof.k 150 > "bench/lof_satimage-2_$i.log";  done
    for i in `seq 1 10`; do echo lof_mammography_$i; java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/mammography.csv -parser.labelIndices 6 -algorithm outlier.lof.LOF -lof.k 185 > "bench/lof_mammography_$i.log"; done
    for i in `seq 1 10`; do echo lof_shuttle_$i;     java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/shuttle.csv -parser.labelIndices 9 -algorithm outlier.lof.LOF -lof.k 3400    > "bench/lof_shuttle_$i.log";     done
    for i in `seq 1 10`; do echo lof_http_$i;        java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/http.csv -parser.labelIndices 3 -algorithm outlier.lof.LOF -lof.k 2300       > "bench/lof_http_$i.log";        done
}

search() {
    for k in `seq 1 50`; do
      echo "lof_parkinson_k=${k}"
      java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
      -dbc.in ../datasets/parkinson.csv -parser.labelIndices 22 \
      -algorithm outlier.lof.LOF -lof.k $k \
      > "params/lof_parkinson_k=${k}.csv"
    done

    for k in `seq 1 50`; do
      echo "lof_hepatitis_k=${k}"
      java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
      -dbc.in ../datasets/hepatitis.csv -parser.labelIndices 20 \
      -algorithm outlier.lof.LOF -lof.k $k \
      > "params/lof_hepatitis_k=${k}.csv"
    done


    for k in `seq 1 50`; do
      echo "lof_glass_k=${k}"
      java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
      -dbc.in ../datasets/glass.csv -parser.labelIndices 9 \
      -algorithm outlier.lof.LOF -lof.k $k \
      > "params/lof_glass_k=${k}.csv"
    done

    for k in `seq 1 50`; do
      echo "lof_ecoli_k=${k}"
      java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
      -dbc.in ../datasets/ecoli.csv -parser.labelIndices 7 \
      -algorithm outlier.lof.LOF -lof.k $k \
      > "params/lof_ecoli_k=${k}.csv"
    done

    for k in `seq 1 50`; do
      echo "lof_ionosphere_k=${k}"
      java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
      -dbc.in ../datasets/ionosphere.csv -parser.labelIndices 33 \
      -algorithm outlier.lof.LOF -lof.k $k \
      > "params/lof_ionosphere_k=${k}.csv"
    done

    for k in `seq 1 50`; do
      echo "lof_breastw_k=${k}"
      java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
      -dbc.in ../datasets/breastw.csv -parser.labelIndices 9 \
      -algorithm outlier.lof.LOF -lof.k $k \
      > "params/lof_breastw_k=${k}.csv"
    done

    for k in `seq 100 500`; do
      echo "lof_pima_k=${k}"
      java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
      -dbc.in ../datasets/pima.csv -parser.labelIndices 8 \
      -algorithm outlier.lof.LOF -lof.k $k \
      > "params/lof_pima_k=${k}.csv"
    done

    for k in `seq 50 150`; do
      echo "lof_thyroid_k=${k}"
      java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
      -dbc.in ../datasets/thyroid.csv -parser.labelIndices 6 \
      -algorithm outlier.lof.LOF -lof.k $k \
      > "params/lof_thyroid_k=${k}.csv"
    done

    for k in `seq 50 150`; do
      echo "lof_satimage-2_k=${k}"
      java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
      -dbc.in ../datasets/satimage-2.csv -parser.labelIndices 36 \
      -algorithm outlier.lof.LOF -lof.k $k \
      > "params/lof_satimage-2_k=${k}.csv"
    done

    for k in `seq 100 250`; do
      echo "lof_mammography_k=${k}"
      java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
      -dbc.in ../datasets/mammography.csv -parser.labelIndices 6 \
      -algorithm outlier.lof.LOF -lof.k $k \
      > "params/lof_mammography_k=${k}.csv"
    done

    for k in `seq 2000 100 5000`; do
      echo "lof_shuttle_k=${k}"
      java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
      -dbc.in ../datasets/shuttle.csv -parser.labelIndices 9 \
      -algorithm outlier.lof.LOF -lof.k $k \
      > "params/lof_shuttle_k=${k}.csv"
    done

    for k in `seq 2000 100 4000`; do
      echo "lof_http_k=${k}"
      java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
      -dbc.in ../datasets/http.csv -parser.labelIndices 3 \
      -algorithm outlier.lof.LOF -lof.k $k \
      > "params/lof_http_k=${k}.csv"
    done
}

case "$1" in
    -b) benchmark ;;
    -s) search ;;
    *)  echo "Usage: ./script.sh [-b | -s]" ;;
esac