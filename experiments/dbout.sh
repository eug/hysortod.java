benchmark() {
    for i in `seq 1 10`; do echo dbout_parkinson_$i;   java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/parkinson.csv -parser.labelIndices 22 -algorithm outlier.distance.DBOutlierScore -dbod.d 20   > "bench/dbout_parkinson_$i.log";   done
    for i in `seq 1 10`; do echo dbout_hepatitis_$i;   java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/hepatitis.csv -parser.labelIndices 20 -algorithm outlier.distance.DBOutlierScore -dbod.d 29   > "bench/dbout_hepatitis_$i.log";   done
    for i in `seq 1 10`; do echo dbout_glass_$i;       java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/glass.csv -parser.labelIndices 9 -algorithm outlier.distance.DBOutlierScore -dbod.d 1         > "bench/dbout_glass_$i.log";       done
    for i in `seq 1 10`; do echo dbout_ecoli_$i;       java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/ecoli.csv -parser.labelIndices 7 -algorithm outlier.distance.DBOutlierScore -dbod.d 1         > "bench/dbout_ecoli_$i.log";       done
    for i in `seq 1 10`; do echo dbout_ionosphere_$i;  java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/ionosphere.csv -parser.labelIndices 33 -algorithm outlier.distance.DBOutlierScore -dbod.d 2   > "bench/dbout_ionosphere_$i.log";  done
    for i in `seq 1 10`; do echo dbout_breastw_$i;     java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/breastw.csv -parser.labelIndices 9 -algorithm outlier.distance.DBOutlierScore -dbod.d 6       > "bench/dbout_breastw_$i.log";     done
    for i in `seq 1 10`; do echo dbout_pima_$i;        java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/pima.csv -parser.labelIndices 8 -algorithm outlier.distance.DBOutlierScore -dbod.d 134        > "bench/dbout_pima_$i.log";        done
    for i in `seq 1 10`; do echo dbout_thyroid_$i;     java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/thyroid.csv -parser.labelIndices 6 -algorithm outlier.distance.DBOutlierScore -dbod.d 30      > "bench/dbout_thyroid_$i.log";     done
    for i in `seq 1 10`; do echo dbout_satimage-2_$i;  java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/satimage-2.csv -parser.labelIndices 36 -algorithm outlier.distance.DBOutlierScore -dbod.d 100 > "bench/dbout_satimage-2_$i.log";  done
    for i in `seq 1 10`; do echo dbout_mammography_$i; java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/mammography.csv -parser.labelIndices 6 -algorithm outlier.distance.DBOutlierScore -dbod.d 3   > "bench/dbout_mammography_$i.log"; done
    for i in `seq 1 10`; do echo dbout_shuttle_$i;     java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/shuttle.csv -parser.labelIndices 9 -algorithm outlier.distance.DBOutlierScore -dbod.d 2500    > "bench/dbout_shuttle_$i.log";     done
    for i in `seq 1 10`; do echo dbout_http_$i;        java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/http.csv -parser.labelIndices 3 -algorithm outlier.distance.DBOutlierScore -dbod.d 2600       > "bench/dbout_http_$i.log";        done   
}

search() {
    for d in `seq 1 50`; do
        echo "dbout_parkinson_d=${d}"
        java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
        -dbc.in ../datasets/parkinson.csv -parser.labelIndices 22 \
        -algorithm outlier.distance.DBOutlierScore -dbod.d $d \
        > "params/dbout_parkinson_d=${d}.csv"
    done

    for d in `seq 1 50`; do
        echo "dbout_hepatitis_d=${d}"
        java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
        -dbc.in ../datasets/hepatitis.csv -parser.labelIndices 20 \
        -algorithm outlier.distance.DBOutlierScore -dbod.d $d \
        > "params/dbout_hepatitis_d=${d}.csv"
    done

    for d in `seq 1 50`; do
        echo "dbout_glass_d=${d}"
        java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
        -dbc.in ../datasets/glass.csv -parser.labelIndices 9 \
        -algorithm outlier.distance.DBOutlierScore -dbod.d $d \
        > "params/dbout_glass_d=${d}.csv"
    done

    for d in `seq 1 50`; do
        echo "dbout_ecoli_d=${d}"
        java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
        -dbc.in ../datasets/ecoli.csv -parser.labelIndices 7 \
        -algorithm outlier.distance.DBOutlierScore -dbod.d $d \
        > "params/dbout_ecoli_d=${d}.csv"
    done

    for d in `seq 1 50`; do
        echo "dbout_ionosphere_d=${d}"
        java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
        -dbc.in ../datasets/ionosphere.csv -parser.labelIndices 33 \
        -algorithm outlier.distance.DBOutlierScore -dbod.d $d \
        > "params/dbout_ionosphere_d=${d}.csv"
    done

    for d in `seq 1 50`; do
        echo "dbout_breastw_d=${d}"
        java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
        -dbc.in ../datasets/breastw.csv -parser.labelIndices 9 \
        -algorithm outlier.distance.DBOutlierScore -dbod.d $d \
        > "params/dbout_breastw_d=${d}.csv"
    done

    for d in `seq 10 200`; do
        echo "dbout_pima_d=${d}"
        java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
        -dbc.in ../datasets/pima.csv -parser.labelIndices 8 \
        -algorithm outlier.distance.DBOutlierScore -dbod.d $d \
        > "params/dbout_pima_d=${d}.csv"
    done

    for d in `seq 1 50`; do
        echo "dbout_thyroid_d=${d}"
        java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
        -dbc.in ../datasets/thyroid.csv -parser.labelIndices 6 \
        -algorithm outlier.distance.DBOutlierScore -dbod.d $d \
        > "params/dbout_thyroid_d=${d}.csv"
    done

    for d in `seq 10 10 200`; do
        echo "dbout_satimage2_d=${d}"
        java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
        -dbc.in ../datasets/satimage-2.csv -parser.labelIndices 36 \
        -algorithm outlier.distance.DBOutlierScore -dbod.d $d \
        > "params/dbout_satimage2_d=${d}.csv"
    done

    for d in `seq 1 10`; do
        echo "dbout_mammography_d=${d}"
        java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
        -dbc.in ../datasets/mammography.csv -parser.labelIndices 6 \
        -algorithm outlier.distance.DBOutlierScore -dbod.d $d \
        > "params/dbout_mammography_d=${d}.csv"
    done

    for d in `seq 1000 50 3000`; do
        echo "dbout_shuttle_d=${d}"
        java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
        -dbc.in ../datasets/shuttle.csv -parser.labelIndices 9 \
        -algorithm outlier.distance.DBOutlierScore -dbod.d $d \
        > "params/dbout_shuttle_d=${d}.csv"
    done

    for d in `seq 1000 50 3000`; do
        echo "dbout_http_d=${d}"
        java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
        -dbc.in ../datasets/http.csv -parser.labelIndices 9 \
        -algorithm outlier.distance.DBOutlierScore -dbod.d $d \
        > "params/dbout_http_d=${d}.csv"
    done
}

case "$1" in
    -b) benchmark ;;
    -s) search ;;
    *)  echo "Usage: ./script.sh [-b | -s]" ;;
esac
