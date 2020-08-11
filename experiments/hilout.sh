benchmark() {
    for i in `seq 1 10`; do echo hilout_parkinson_$i;   java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/parkinson.csv -parser.labelIndices 22 -algorithm outlier.distance.HilOut -HilOut.k 2 -HilOut.h 11 -HilOut.tn All  > "bench/hilout_parkinson_$i.log";   done
    for i in `seq 1 10`; do echo hilout_hepatitis_$i;   java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/hepatitis.csv -parser.labelIndices 20 -algorithm outlier.distance.HilOut -HilOut.k 2 -HilOut.h 10 -HilOut.tn All  > "bench/hilout_hepatitis_$i.log";   done
    for i in `seq 1 10`; do echo hilout_glass_$i;       java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/glass.csv -parser.labelIndices 9 -algorithm outlier.distance.HilOut -HilOut.k 10 -HilOut.h 9 -HilOut.tn All       > "bench/hilout_glass_$i.log";       done
    for i in `seq 1 10`; do echo hilout_ecoli_$i;       java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/ecoli.csv -parser.labelIndices 7 -algorithm outlier.distance.HilOut -HilOut.k 100 -HilOut.h 31 -HilOut.tn All     > "bench/hilout_ecoli_$i.log";       done
    for i in `seq 1 10`; do echo hilout_ionosphere_$i;  java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/ionosphere.csv -parser.labelIndices 33 -algorithm outlier.distance.HilOut -HilOut.k 7 -HilOut.h 30 -HilOut.tn All > "bench/hilout_ionosphere_$i.log";  done
    for i in `seq 1 10`; do echo hilout_breastw_$i;     java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/breastw.csv -parser.labelIndices 9 -algorithm outlier.distance.HilOut -HilOut.k 10 -HilOut.h 22 -HilOut.tn All    > "bench/hilout_breastw_$i.log";     done
    for i in `seq 1 10`; do echo hilout_pima_$i;        java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/pima.csv -parser.labelIndices 8 -algorithm outlier.distance.HilOut -HilOut.k 450 -HilOut.h 19 -HilOut.tn All      > "bench/hilout_pima_$i.log";        done
    for i in `seq 1 10`; do echo hilout_thyroid_$i;     java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/thyroid.csv -parser.labelIndices 6 -algorithm outlier.distance.HilOut -HilOut.k 9 -HilOut.h 22 -HilOut.tn All     > "bench/hilout_thyroid_$i.log";     done
    for i in `seq 1 10`; do echo hilout_satimage-2_$i;  java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/satimage-2.csv -parser.labelIndices 36 -algorithm outlier.distance.HilOut -HilOut.k 64 -HilOut.h 2 -HilOut.tn All > "bench/hilout_satimage-2_$i.log";  done
    for i in `seq 1 10`; do echo hilout_mammography_$i; java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/mammography.csv -parser.labelIndices 6 -algorithm outlier.distance.HilOut -HilOut.k 12 -HilOut.h 3 -HilOut.tn All > "bench/hilout_mammography_$i.log"; done
    for i in `seq 1 10`; do echo hilout_shuttle_$i;     java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/shuttle.csv -parser.labelIndices 9 -algorithm outlier.distance.HilOut -HilOut.k 7 -HilOut.h 2 -HilOut.tn All      > "bench/hilout_shuttle_$i.log";     done
    # for i in `seq 1 10`; do echo hilout_http_$i;        java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time -dbc.in ../datasets/http.csv -parser.labelIndices 3 -algorithm outlier.distance.HilOut -HilOut.k ? -HilOut.h ? -HilOut.tn All        > "bench/hilout_http_$i.log";        done
}

search() {
    for h in `seq 1 64`; do
        for k in `seq 1 10`; do
            echo "hilout_parkinson_k=${k}_h=${h}"
            java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
            -dbc.in ../datasets/parkinson.csv -parser.labelIndices 22 \
            -algorithm outlier.distance.HilOut -HilOut.k $k -HilOut.h $h -HilOut.tn All \
            > "params/hilout_parkinson_k=${k}_h=${h}.csv"
        done
    done

    for h in `seq 1 64`; do
        for k in `seq 1 10`; do
            echo "hilout_hepatitis_k=${k}_h=${h}"
            java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
            -dbc.in ../datasets/hepatitis.csv -parser.labelIndices 20 \
            -algorithm outlier.distance.HilOut -HilOut.k $k -HilOut.h $h -HilOut.tn All \
            > "params/hilout_hepatitis_k=${k}_h=${h}.csv"
        done
    done

    for h in `seq 1 64`; do
        for k in `seq 1 100`; do
            echo "hilout_glass_k=${k}_h=${h}"
            java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
            -dbc.in ../datasets/glass.csv -parser.labelIndices 9 \
            -algorithm outlier.distance.HilOut -HilOut.k $k -HilOut.h $h -HilOut.tn All \
            > "params/hilout_glass_k=${k}_h=${h}.csv"
        done
    done

    for h in `seq 1 40`; do
        for k in `seq 10 110`; do
            echo "hilout_ecoli_k=${k}_h=${h}"
            java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
            -dbc.in ../datasets/ecoli.csv -parser.labelIndices 7 \
            -algorithm outlier.distance.HilOut -HilOut.k $k -HilOut.h $h -HilOut.tn All \
            > "params/hilout_ecoli_k=${k}_h=${h}.csv"
        done
    done

    for h in `seq 2 2 50`; do
        for k in `seq 1 20`; do
            echo "hilout_ionosphere_k=${k}_h=${h}"
            java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
            -dbc.in ../datasets/ionosphere.csv -parser.labelIndices 33 \
            -algorithm outlier.distance.HilOut -HilOut.k $k -HilOut.h $h -HilOut.tn All \
            > "params/hilout_ionosphere_k=${k}_h=${h}.csv"
        done
    done

    for h in `seq 2 32`; do
        for k in `seq 1 20`; do
            echo "hilout_breastw_k=${k}_h=${h}"
            java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
            -dbc.in ../datasets/breastw.csv -parser.labelIndices 9 \
            -algorithm outlier.distance.HilOut -HilOut.k $k -HilOut.h $h -HilOut.tn All \
            > "params/hilout_breastw_k=${k}_h=${h}.csv"
        done
    done

    for h in `seq 1 20`; do
        for k in `seq 100 10 500`; do
            echo "hilout_pima_k=${k}_h=${h}"
            java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
            -dbc.in ../datasets/pima.csv -parser.labelIndices 8 \
            -algorithm outlier.distance.HilOut -HilOut.k $k -HilOut.h $h -HilOut.tn All \
            > "params/hilout_pima_k=${k}_h=${h}.csv"
        done
    done

    for h in `seq 1 64`; do
        for k in `seq 1 20`; do
            echo "hilout_thyroid_k=${k}_h=${h}"
            java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
            -dbc.in ../datasets/thyroid.csv -parser.labelIndices 6 \
            -algorithm outlier.distance.HilOut -HilOut.k $k -iHlOut.h $h -HilOut.tn All \
            > "params/hilout_thyroid_k=${k}_h=${h}.csv"
        done
    done

    for h in `seq 1 64`; do
        for k in `seq 1 70`; do
            echo "hilout_satimage-2_k=${k}_h=${h}"
            java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
            -dbc.in ../datasets/satimage-2.csv -parser.labelIndices 36 \
            -algorithm outlier.distance.HilOut -HilOut.k $k -HilOut.h $h -HilOut.tn All \
            > "params/hilout_satimage-2_k=${k}_h=${h}.csv"
        done
    done

    for h in `seq 1 64`; do
        for k in `seq 1 50`; do
            echo "hilout_mammography_k=${k}_h=${h}"
            java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
            -dbc.in ../datasets/mammography.csv -parser.labelIndices 6 \
            -algorithm outlier.distance.HilOut -HilOut.k $k -HilOut.h $h -HilOut.tn All \
            > "params/hilout_mammography_k=${k}_h=${h}.csv"
        done
    done


    for h in `seq 1 64`; do
        for k in `seq 1 20`; do
            echo "hilout_shuttle_k=${k}_h=${h}"
            java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
            -dbc.in ../datasets/shuttle.csv -parser.labelIndices 9 \
            -algorithm outlier.distance.HilOut -HilOut.k $k -HilOut.h $h -HilOut.tn All \
            > "params/hilout_shuttle_k=${k}_h=${h}.csv"
        done
    done

    # for h in `seq 1  64`; do
    #     for k in `seq 100 100 3000`; do
    #         echo "hilout_http_k=${k}_h=${h}"
    #         java -jar elki-bundle-0.7.2-SNAPSHOT.jar KDDCLIApplication -time \
    #         -dbc.in ../datasets/http.csv -parser.labelIndices 3 \
    #         -algorithm outlier.distance.HilOut -HilOut.k $k -HilOut.h $h -HilOut.tn All \
    #         > "params/hilout_http_k=${k}_h=${h}.csv"
    #     done
    # done
}


case "$1" in
    -b) benchmark ;;
    -s) search ;;
    *)  echo "Usage: ./script.sh [-b | -s]" ;;
esac



