
benchmark() {
    for i in `seq 1 10`; do echo odin_parkinson_$i;  java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/parkinson.csv -parser.labelIndices 22 -algorithm outlier.distance.ODIN -odin.k 2     > "bench/odin_parkinson_$i.log";   done
    for i in `seq 1 10`; do echo odin_hepatitis_$i;  java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/hepatitis.csv -parser.labelIndices 20 -algorithm outlier.distance.ODIN -odin.k 9     > "bench/odin_hepatitis_$i.log";   done
    for i in `seq 1 10`; do echo odin_glass_$i;      java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/glass.csv -parser.labelIndices 9 -algorithm outlier.distance.ODIN -odin.k 12         > "bench/odin_glass_$i.log";       done
    for i in `seq 1 10`; do echo odin_ecoli_$i;      java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/ecoli.csv -parser.labelIndices 7 -algorithm outlier.distance.ODIN -odin.k 200        > "bench/odin_ecoli_$i.log";       done
    for i in `seq 1 10`; do echo odin_ionosphere_$i; java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/ionosphere.csv -parser.labelIndices 33 -algorithm outlier.distance.ODIN -odin.k 16   > "bench/odin_ionosphere_$i.log";  done
    for i in `seq 1 10`; do echo odin_breastw_$i;    java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/breastw.csv -parser.labelIndices 9 -algorithm outlier.distance.ODIN -odin.k 2        > "bench/odin_breastw_$i.log";     done
    for i in `seq 1 10`; do echo odin_pima_$i;       java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/pima.csv -parser.labelIndices 8 -algorithm outlier.distance.ODIN -odin.k 219         > "bench/odin_pima_$i.log";        done
    for i in `seq 1 10`; do echo odin_thyroid_$i;    java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/thyroid.csv -parser.labelIndices 6 -algorithm outlier.distance.ODIN -odin.k 30       > "bench/odin_thyroid_$i.log";     done
    for i in `seq 1 10`; do echo odin_satimage-2_$i; java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/satimage-2.csv -parser.labelIndices 36 -algorithm outlier.distance.ODIN -odin.k 1200 > "bench/odin_satimage-2_$i.log";  done
    for i in `seq 1 10`; do echo odin_mammography_$i;java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/mammography.csv -parser.labelIndices 6 -algorithm outlier.distance.ODIN -odin.k 1750 > "bench/odin_mammography_$i.log"; done
    for i in `seq 1 10`; do echo odin_shuttle_$i;    java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/shuttle.csv -parser.labelIndices 9 -algorithm outlier.distance.ODIN -odin.k 10000    > "bench/odin_shuttle_$i.log";     done
    for i in `seq 1 10`; do echo odin_http_$i;       java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/http.csv -parser.labelIndices 3 -algorithm outlier.distance.ODIN -odin.k 5000        > "bench/odin_http_$i.log";        done    
}

search() {
    for k in `seq 1 50`; do
        echo "odin_parkinson_k=${k}"
        java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
        -dbc.in ../datasets/parkinson.csv -parser.labelIndices 22 \
        -algorithm outlier.distance.ODIN -odin.k $k \
        > "params/odin_parkinson_k=${k}.csv"
    done

    for k in `seq 1 50`; do
        echo "odin_hepatitis_k=${k}"
        java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
        -dbc.in ../datasets/hepatitis.csv -parser.labelIndices 20 \
        -algorithm outlier.distance.ODIN -odin.k $k \
        > "params/odin_hepatitis_k=${k}.csv"
    done

    for k in `seq 1 300`; do
        echo "odin_ecoli_k=${k}"
        java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
        -dbc.in ../datasets/ecoli.csv -parser.labelIndices 7 \
        -algorithm outlier.distance.ODIN -odin.k $k \
        > "params/odin_ecoli_k=${k}.csv"
    done

    for k in `seq 1 50`; do
        echo "odin_ionosphere_k=${k}"
        java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
        -dbc.in ../datasets/ionosphere.csv -parser.labelIndices 33 \
        -algorithm outlier.distance.ODIN -odin.k $k \
        > "params/odin_ionosphere_k=${k}.csv"
    done

    for k in `seq 1 50`; do
        echo "odin_breastw_k=${k}"
        java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
        -dbc.in ../datasets/breastw.csv -parser.labelIndices 9 \
        -algorithm outlier.distance.ODIN -odin.k $k \
        > "params/odin_breastw_k=${k}.csv"
    done

    for k in `seq 1 300`; do
        echo "odin_pima_k=${k}"
        java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
        -dbc.in ../datasets/pima.csv -parser.labelIndices 8 \
        -algorithm outlier.distance.ODIN -odin.k $k \
        > "params/odin_pima_k=${k}.csv"
    done


    for k in `seq 1 100`; do
        echo "odin_thyroid_k=${k}"
        java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
        -dbc.in ../datasets/ionosphere.csv -parser.labelIndices 33 \
        -algorithm outlier.distance.ODIN -odin.k $k \
        > "params/odin_thyroid_k=${k}.csv"
    done

    for k in `seq 10 10 2000`; do
        echo "odin_satimage2_k=${k}"
        java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
        -dbc.in ../datasets/satimage-2.csv -parser.labelIndices 36 \
        -algorithm outlier.distance.ODIN -odin.k $k \
        > "params/odin_satimage2_k=${k}.csv"
    done

    for k in `seq 100 50 2000`; do
        echo "odin_mammography_k=${k}"
        java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
        -dbc.in ../datasets/mammography.csv -parser.labelIndices 6 \
        -algorithm outlier.distance.ODIN -odin.k $k \
        > "params/odin_mammography_k=${k}.csv"
    done

    for k in `seq 1000 100 12000`; do
        echo "odin_shuttle_k=${k}"
        java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
        -dbc.in ../datasets/shuttle.csv -parser.labelIndices 9 \
        -algorithm outlier.distance.ODIN -odin.k $k \
        > "params/odin_shuttle_k=${k}.csv"
    done

    for k in `seq 2000 100 7000`; do
        echo "odin_http_k=${k}"
        java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
        -dbc.in ../datasets/http.csv -parser.labelIndices 3 \
        -algorithm outlier.distance.ODIN -odin.k $k \
        > "params/odin_http_k=${k}.csv"
    done
}


case "$1" in
    -b) benchmark ;;
    -s) search ;;
    *)  echo "Usage: ./script.sh [-b | -s]" ;;
esac
