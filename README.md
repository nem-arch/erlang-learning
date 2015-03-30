erlang-learning
===============

## demo.erl
some very basic erlang examples

usage:

```
$ erl
1> c(demo).
{ok,demo}
2> demo:fact(5).
120
3> q().
$
```
## drones.erl, echo.erl
some basic process communication

usage:

```
$ erl
1> c(drones).
{ok,drones}
2> drones:run().
...
3> q().
$
```

## ftest.erl, fileop.erl
some basic file io

## calc.erl
small math console for arbitrary bases

usage:

```
$ chmod +x calc.erl
$ ./calc.erl
> 16#B * 5.
h 37
d 55
b 110111
o 67
> A=math:sqrt(2), A*2.
f 2.828427
> q.
$
```
