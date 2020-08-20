# HySortOD
<p align="center">
    <img width="150" src="hysortod-logo.svg"/>
</p>
Outlier Detection with Sorted Hypercubes. Python version is available in <a href="https://github.com/eug/hysortod.py">hysortod.py</a>.


### Build

```sh
mvn package
```

### Run

```sh
java -jar target/hysortod-0.0.1-SNAPSHOT.jar datasets/http.csv 3 5 100 1
```

### Reference
Eugenio F. Cabral and Robson L. F. Cordeiro. 2020. Fast and Scalable Outlier Detection with Sorted Hypercubes. In Proceedings of the 29th ACM International Conference on Information and Knowledge Management (CIKM'20), October 19–23, 2020. Virtual Event, Ireland. ACM, New York, NY, USA, 10 pages.
