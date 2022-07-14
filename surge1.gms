set
t        no_of_period     /1*30/
t1(t)    period no 1     /1/
t2(t)    period no 2     /1*2/
t3(t)    period no 3     /1*3/
t4(t)    period no 4     /1*4/
t5(t)    period no 5     /1*5/
t6(t)    period no 6     /1*6/
t7(t)    period no 7     /1*7/
t8(t)    period no 8     /1*8/
t9(t)    period no 9     /1*9/
t10(t)   period no 10    /1*10/
t11(t)   period no 11    /1*11/
t12(t)   period no 12    /1*12/
t13(t)   period no 13    /1*13/
t14(t)   period no 14    /1*14/
t15(t)   period no 15    /1*15/
t16(t)   period no 16    /1*16/
t17(t)   period no 17    /1*17/
t18(t)   period no 18    /1*18/
t19(t)   period no 19    /1*19/
t20(t)   period no 20    /1*20/
t21(t)   period no 21    /1*21/
t22(t)   period no 22    /1*22/
t23(t)   period no 23    /1*23/
t24(t)   period no 24    /1*24/
t25(t)   period no 25    /1*25/
t26(t)   period no 26    /1*26/
t27(t)   period no 27    /1*27/
t28(t)   period no 28    /1*28/
t29(t)   period no 29    /1*29/;

*taken subset of the total time period

Parameter f(t) fixed cost in time t

$call GDXXRW ww11.xlsx par=f rng=sheet28!a2:b31 rdim=1 cdim=0
$GDXIN ww11.gdx
$Load f
$GDXIN

Parameter D(t) demand for the item during the time t
$call GDXXRW ww11.xlsx par=D rng=sheet28!a34:b63 rdim=1 cdim=0
$GDXIN ww11.gdx
$Load D
$GDXIN

Parameter h(t) per unit inventory carrying cost in time t

$call GDXXRW ww11.xlsx par=h rng=sheet28!a66:b95 rdim=1 cdim=0
$GDXIN ww11.gdx
$Load h
$GDXIN


Scalar I0 Starting inventory /0/ ;

Variables

    z    objective function for total Optimal_Cost
    y(t) binary variable to denote production (0 means no 1 mean yes)
    x(t) production variable- how much in produced
    I(t) inventory in time t- remaining items after production

Positive Variable x;
Positive Variable I;
Binary Variable y ;

Equations
cost             total optimal cost
flowbal1         flow balance equation time period 1
flowbal2         flow balance equation time period 2
flowbal3         flow balance equation time period 3
flowbal4         flow balance equation time period 4
flowbal5         flow balance equation time period 5
flowbal6         flow balance equation time period 6
flowbal7         flow balance equation time period 7
flowbal8         flow balance equation time period 8
flowbal9         flow balance equation time period 9
flowbal10        flow balance equation time period 10
flowbal11        flow balance equation time period 11
flowbal12        flow balance equation time period 12
flowbal13        flow balance equation time period 13
flowbal14        flow balance equation time period 14
flowbal15        flow balance equation time period 15
flowbal16        flow balance equation time period 16
flowbal17        flow balance equation time period 17
flowbal18        flow balance equation time period 18
flowbal19        flow balance equation time period 19
flowbal20        flow balance equation time period 20
flowbal21        flow balance equation time period 21
flowbal22        flow balance equation time period 22
flowbal23        flow balance equation time period 23
flowbal24        flow balance equation time period 24
flowbal25        flow balance equation time period 25
flowbal26        flow balance equation time period 26
flowbal27        flow balance equation time period 27
flowbal28        flow balance equation time period 28
flowbal29        flow balance equation time period 29
flowbal30        flow balance equation time period 30
fnl_inv          final inventory
qtybal(t)        quantity balance equation
;

* objective function
Cost..   z =e=  sum((t), f(t)*y(t)) + sum((t), h(t)*I(t));


* constraints

flowbal1..       x('1') =e= D('1') + I('1');
flowbal2..       sum((t2), x(t2)) =e= sum ((t2), D(t2)) + I('2');
flowbal3..       sum((t3), x(t3)) =e= sum ((t3), D(t3)) + I('3');
flowbal4..       sum((t4), x(t4)) =e= sum ((t4), D(t4)) + I('4');
flowbal5..       sum((t5), x(t5)) =e= sum ((t5), D(t5)) + I('5');
flowbal6..       sum((t6), x(t6)) =e= sum ((t6), D(t6)) + I('6');
flowbal7..       sum((t7), x(t7)) =e= sum ((t7), D(t7)) + I('7');
flowbal8..       sum((t8), x(t8)) =e= sum ((t8), D(t8)) + I('8');
flowbal9..       sum((t9), x(t9)) =e= sum ((t9), D(t9)) + I('9');
flowbal10..      sum((t10), x(t10)) =e= sum ((t10), D(t10)) + I('10');
flowbal11..      sum((t11), x(t11)) =e= sum ((t11), D(t11)) + I('11');
flowbal12..      sum((t12), x(t12)) =e= sum ((t12), D(t12)) + I('12');
flowbal13..      sum((t13), x(t13)) =e= sum ((t13), D(t13)) + I('13');
flowbal14..      sum((t14), x(t14)) =e= sum ((t14), D(t14)) + I('14');
flowbal15..      sum((t15), x(t15)) =e= sum ((t15), D(t15)) + I('15');
flowbal16..      sum((t16), x(t16)) =e= sum ((t16), D(t16)) + I('16');
flowbal17..      sum((t17), x(t17)) =e= sum ((t17), D(t17)) + I('17');
flowbal18..      sum((t18), x(t18)) =e= sum ((t18), D(t18)) + I('18');
flowbal19..      sum((t19), x(t19)) =e= sum ((t19), D(t19)) + I('19');
flowbal20..      sum((t20), x(t20)) =e= sum ((t20), D(t20)) + I('20');
flowbal21..      sum((t21), x(t21)) =e= sum ((t21), D(t21)) + I('21');
flowbal22..      sum((t22), x(t22)) =e= sum ((t22), D(t22)) + I('22');
flowbal23..      sum((t23), x(t23)) =e= sum ((t23), D(t23)) + I('23');
flowbal24..      sum((t24), x(t24)) =e= sum ((t24), D(t24)) + I('24');
flowbal25..      sum((t25), x(t25)) =e= sum ((t25), D(t25)) + I('25');
flowbal26..      sum((t26), x(t26)) =e= sum ((t26), D(t26)) + I('26');
flowbal27..      sum((t27), x(t27)) =e= sum ((t27), D(t27)) + I('27');
flowbal28..      sum((t28), x(t28)) =e= sum ((t28), D(t28)) + I('28');
flowbal29..      sum((t29), x(t29)) =e= sum ((t29), D(t29)) + I('29');
flowbal30..      sum((t), x(t)) =e= sum ((t), D(t)) + I('30');
fnl_inv..         I('30') =e= 0 ;
qtybal(t)..      x(t) =l= 1000000*y(t);


Model surge /all/;

surge.optcr=0;

surge.iterlim=1000000000;
surge.reslim=1000000000;

option mip = Cplex;

solve surge minimizing z using mip;
display z.l;


