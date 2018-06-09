libname rg '/folders/myfolders/rg';
option compress = yes;

data rg.creditcard (drop=Class); set rg.creditcard (rename=(Class_num=Fraud)); run;
proc contents data=rg.creditcard; run;

/*Bins*/
%macro var_bin (var);
proc rank data=rg.creditcard out=rg.creditcard groups=20;
var &var; ranks &var._;
run;
data rg.creditcard (drop=&var.); set rg.creditcard;
if &var._ = . then &var._ = -1;
run;
proc sql;
create table m1 as 
select &var._, mean(Fraud) as &var._bin
from rg.creditcard
group by &var._;
quit;
proc sql;
create table m2 as 
select a.*, b.&var._bin
from rg.creditcard as a left join m1 as b
on a.&var._ = b.&var._;
quit;
data rg.creditcard; set m2 (drop=&var._); if &var._bin = . then &var._bin = 0; run;
%mend;

%var_bin(V1);
%var_bin(V2);
%var_bin(V3);
%var_bin(V4);
%var_bin(V5);
%var_bin(V6);
%var_bin(V7);
%var_bin(V8);
%var_bin(V9);
%var_bin(V10);
%var_bin(V11);
%var_bin(V12);
%var_bin(V13);
%var_bin(V14);
%var_bin(V15);
%var_bin(V16);
%var_bin(V17);
%var_bin(V18);
%var_bin(V19);
%var_bin(V20);
%var_bin(V21);
%var_bin(V22);
%var_bin(V23);
%var_bin(V24);
%var_bin(V25);
%var_bin(V26);
%var_bin(V27);
%var_bin(V28);
%var_bin(V29);
proc contents data=rg.creditcard; run;

%var_bin(A1);	%var_bin(S1);	%var_bin(M1);	%var_bin(D1);
%var_bin(A2);	%var_bin(S2);	%var_bin(M2);	%var_bin(D2);
%var_bin(A3);	%var_bin(S3);	%var_bin(M3);	%var_bin(D3);
%var_bin(A4);	%var_bin(S4);	%var_bin(M4);	%var_bin(D4);
%var_bin(A5);	%var_bin(S5);	%var_bin(M5);	%var_bin(D5);
%var_bin(A6);	%var_bin(S6);	%var_bin(M6);	%var_bin(D6);
%var_bin(A7);	%var_bin(S7);	%var_bin(M7);	%var_bin(D7);
%var_bin(A8);	%var_bin(S8);	%var_bin(M8);	%var_bin(D8);
%var_bin(A9);	%var_bin(S9);	%var_bin(M9);	%var_bin(D9);
%var_bin(A10);	%var_bin(S10);	%var_bin(M10);	%var_bin(D10);
%var_bin(A11);	%var_bin(S11);	%var_bin(M11);	%var_bin(D11);
%var_bin(A12);	%var_bin(S12);	%var_bin(M12);	%var_bin(D12);
%var_bin(A13);	%var_bin(S13);	%var_bin(M13);	%var_bin(D13);
%var_bin(A14);	%var_bin(S14);	%var_bin(M14);	%var_bin(D14);
%var_bin(A15);	%var_bin(S15);	%var_bin(M15);	%var_bin(D15);
%var_bin(A16);	%var_bin(S16);	%var_bin(M16);	%var_bin(D16);
%var_bin(A17);	%var_bin(S17);	%var_bin(M17);	%var_bin(D17);
%var_bin(A18);	%var_bin(S18);	%var_bin(M18);	%var_bin(D18);
%var_bin(A19);	%var_bin(S19);	%var_bin(M19);	%var_bin(D19);
%var_bin(A20);	%var_bin(S20);	%var_bin(M20);	%var_bin(D20);
%var_bin(A21);	%var_bin(S21);	%var_bin(M21);	%var_bin(D21);
%var_bin(A22);	%var_bin(S22);	%var_bin(M22);	%var_bin(D22);
%var_bin(A23);	%var_bin(S23);	%var_bin(M23);	%var_bin(D23);
%var_bin(A24);	%var_bin(S24);	%var_bin(M24);	%var_bin(D24);
%var_bin(A25);	%var_bin(S25);	%var_bin(M25);	%var_bin(D25);
%var_bin(A26);	%var_bin(S26);	%var_bin(M26);	%var_bin(D26);
%var_bin(A27);	%var_bin(S27);	%var_bin(M27);	%var_bin(D27);
%var_bin(A28);	%var_bin(S28);	%var_bin(M28);	%var_bin(D28);
%var_bin(A29);	%var_bin(S29);	%var_bin(M29);	%var_bin(D29);
%var_bin(A30);	%var_bin(S30);	%var_bin(M30);	%var_bin(D30);
%var_bin(A31);	%var_bin(S31);	%var_bin(M31);	%var_bin(D31);
%var_bin(A32);	%var_bin(S32);	%var_bin(M32);	%var_bin(D32);
%var_bin(A33);	%var_bin(S33);	%var_bin(M33);	%var_bin(D33);
%var_bin(A34);	%var_bin(S34);	%var_bin(M34);	%var_bin(D34);
%var_bin(A35);	%var_bin(S35);	%var_bin(M35);	%var_bin(D35);
%var_bin(A36);	%var_bin(S36);	%var_bin(M36);	%var_bin(D36);
%var_bin(A37);	%var_bin(S37);	%var_bin(M37);	%var_bin(D37);
%var_bin(A38);	%var_bin(S38);	%var_bin(M38);	%var_bin(D38);
%var_bin(A39);	%var_bin(S39);	%var_bin(M39);	%var_bin(D39);
%var_bin(A40);	%var_bin(S40);	%var_bin(M40);	%var_bin(D40);
%var_bin(A41);	%var_bin(S41);	%var_bin(M41);	%var_bin(D41);
%var_bin(A42);	%var_bin(S42);	%var_bin(M42);	%var_bin(D42);
%var_bin(A43);	%var_bin(S43);	%var_bin(M43);	%var_bin(D43);
%var_bin(A44);	%var_bin(S44);	%var_bin(M44);	%var_bin(D44);
%var_bin(A45);	%var_bin(S45);	%var_bin(M45);	%var_bin(D45);
%var_bin(A46);	%var_bin(S46);	%var_bin(M46);	%var_bin(D46);
%var_bin(A47);	%var_bin(S47);	%var_bin(M47);	%var_bin(D47);
%var_bin(A48);	%var_bin(S48);	%var_bin(M48);	%var_bin(D48);
%var_bin(A49);	%var_bin(S49);	%var_bin(M49);	%var_bin(D49);
%var_bin(A50);	%var_bin(S50);	%var_bin(M50);	%var_bin(D50);
%var_bin(A51);	%var_bin(S51);	%var_bin(M51);	%var_bin(D51);
%var_bin(A52);	%var_bin(S52);	%var_bin(M52);	%var_bin(D52);
%var_bin(A53);	%var_bin(S53);	%var_bin(M53);	%var_bin(D53);
%var_bin(A54);	%var_bin(S54);	%var_bin(M54);	%var_bin(D54);
%var_bin(A55);	%var_bin(S55);	%var_bin(M55);	%var_bin(D55);
%var_bin(A56);	%var_bin(S56);	%var_bin(M56);	%var_bin(D56);
%var_bin(A57);	%var_bin(S57);	%var_bin(M57);	%var_bin(D57);
%var_bin(A58);	%var_bin(S58);	%var_bin(M58);	%var_bin(D58);
%var_bin(A59);	%var_bin(S59);	%var_bin(M59);	%var_bin(D59);
%var_bin(A60);	%var_bin(S60);	%var_bin(M60);	%var_bin(D60);
%var_bin(A61);	%var_bin(S61);	%var_bin(M61);	%var_bin(D61);
%var_bin(A62);	%var_bin(S62);	%var_bin(M62);	%var_bin(D62);
%var_bin(A63);	%var_bin(S63);	%var_bin(M63);	%var_bin(D63);
%var_bin(A64);	%var_bin(S64);	%var_bin(M64);	%var_bin(D64);
%var_bin(A65);	%var_bin(S65);	%var_bin(M65);	%var_bin(D65);
%var_bin(A66);	%var_bin(S66);	%var_bin(M66);	%var_bin(D66);
%var_bin(A67);	%var_bin(S67);	%var_bin(M67);	%var_bin(D67);
%var_bin(A68);	%var_bin(S68);	%var_bin(M68);	%var_bin(D68);
%var_bin(A69);	%var_bin(S69);	%var_bin(M69);	%var_bin(D69);
%var_bin(A70);	%var_bin(S70);	%var_bin(M70);	%var_bin(D70);
%var_bin(A71);	%var_bin(S71);	%var_bin(M71);	%var_bin(D71);
%var_bin(A72);	%var_bin(S72);	%var_bin(M72);	%var_bin(D72);
%var_bin(A73);	%var_bin(S73);	%var_bin(M73);	%var_bin(D73);
%var_bin(A74);	%var_bin(S74);	%var_bin(M74);	%var_bin(D74);
%var_bin(A75);	%var_bin(S75);	%var_bin(M75);	%var_bin(D75);
%var_bin(A76);	%var_bin(S76);	%var_bin(M76);	%var_bin(D76);
%var_bin(A77);	%var_bin(S77);	%var_bin(M77);	%var_bin(D77);
%var_bin(A78);	%var_bin(S78);	%var_bin(M78);	%var_bin(D78);
%var_bin(A79);	%var_bin(S79);	%var_bin(M79);	%var_bin(D79);
%var_bin(A80);	%var_bin(S80);	%var_bin(M80);	%var_bin(D80);
%var_bin(A81);	%var_bin(S81);	%var_bin(M81);	%var_bin(D81);
%var_bin(A82);	%var_bin(S82);	%var_bin(M82);	%var_bin(D82);
%var_bin(A83);	%var_bin(S83);	%var_bin(M83);	%var_bin(D83);
%var_bin(A84);	%var_bin(S84);	%var_bin(M84);	%var_bin(D84);
%var_bin(A85);	%var_bin(S85);	%var_bin(M85);	%var_bin(D85);
%var_bin(A86);	%var_bin(S86);	%var_bin(M86);	%var_bin(D86);
%var_bin(A87);	%var_bin(S87);	%var_bin(M87);	%var_bin(D87);
%var_bin(A88);	%var_bin(S88);	%var_bin(M88);	%var_bin(D88);
%var_bin(A89);	%var_bin(S89);	%var_bin(M89);	%var_bin(D89);
%var_bin(A90);	%var_bin(S90);	%var_bin(M90);	%var_bin(D90);
%var_bin(A91);	%var_bin(S91);	%var_bin(M91);	%var_bin(D91);
%var_bin(A92);	%var_bin(S92);	%var_bin(M92);	%var_bin(D92);
%var_bin(A93);	%var_bin(S93);	%var_bin(M93);	%var_bin(D93);
%var_bin(A94);	%var_bin(S94);	%var_bin(M94);	%var_bin(D94);
%var_bin(A95);	%var_bin(S95);	%var_bin(M95);	%var_bin(D95);
%var_bin(A96);	%var_bin(S96);	%var_bin(M96);	%var_bin(D96);
%var_bin(A97);	%var_bin(S97);	%var_bin(M97);	%var_bin(D97);
%var_bin(A98);	%var_bin(S98);	%var_bin(M98);	%var_bin(D98);
%var_bin(A99);	%var_bin(S99);	%var_bin(M99);	%var_bin(D99);
%var_bin(A100);	%var_bin(S100);	%var_bin(M100);	%var_bin(D100);
%var_bin(A101);	%var_bin(S101);	%var_bin(M101);	%var_bin(D101);
%var_bin(A102);	%var_bin(S102);	%var_bin(M102);	%var_bin(D102);
%var_bin(A103);	%var_bin(S103);	%var_bin(M103);	%var_bin(D103);
%var_bin(A104);	%var_bin(S104);	%var_bin(M104);	%var_bin(D104);
%var_bin(A105);	%var_bin(S105);	%var_bin(M105);	%var_bin(D105);
%var_bin(A106);	%var_bin(S106);	%var_bin(M106);	%var_bin(D106);
%var_bin(A107);	%var_bin(S107);	%var_bin(M107);	%var_bin(D107);
%var_bin(A108);	%var_bin(S108);	%var_bin(M108);	%var_bin(D108);
%var_bin(A109);	%var_bin(S109);	%var_bin(M109);	%var_bin(D109);
%var_bin(A110);	%var_bin(S110);	%var_bin(M110);	%var_bin(D110);
%var_bin(A111);	%var_bin(S111);	%var_bin(M111);	%var_bin(D111);
%var_bin(A112);	%var_bin(S112);	%var_bin(M112);	%var_bin(D112);
%var_bin(A113);	%var_bin(S113);	%var_bin(M113);	%var_bin(D113);
%var_bin(A114);	%var_bin(S114);	%var_bin(M114);	%var_bin(D114);
%var_bin(A115);	%var_bin(S115);	%var_bin(M115);	%var_bin(D115);
%var_bin(A116);	%var_bin(S116);	%var_bin(M116);	%var_bin(D116);
%var_bin(A117);	%var_bin(S117);	%var_bin(M117);	%var_bin(D117);
%var_bin(A118);	%var_bin(S118);	%var_bin(M118);	%var_bin(D118);
%var_bin(A119);	%var_bin(S119);	%var_bin(M119);	%var_bin(D119);
%var_bin(A120);	%var_bin(S120);	%var_bin(M120);	%var_bin(D120);
%var_bin(A121);	%var_bin(S121);	%var_bin(M121);	%var_bin(D121);
%var_bin(A122);	%var_bin(S122);	%var_bin(M122);	%var_bin(D122);
%var_bin(A123);	%var_bin(S123);	%var_bin(M123);	%var_bin(D123);
%var_bin(A124);	%var_bin(S124);	%var_bin(M124);	%var_bin(D124);
%var_bin(A125);	%var_bin(S125);	%var_bin(M125);	%var_bin(D125);
%var_bin(A126);	%var_bin(S126);	%var_bin(M126);	%var_bin(D126);
%var_bin(A127);	%var_bin(S127);	%var_bin(M127);	%var_bin(D127);
%var_bin(A128);	%var_bin(S128);	%var_bin(M128);	%var_bin(D128);
%var_bin(A129);	%var_bin(S129);	%var_bin(M129);	%var_bin(D129);
%var_bin(A130);	%var_bin(S130);	%var_bin(M130);	%var_bin(D130);
%var_bin(A131);	%var_bin(S131);	%var_bin(M131);	%var_bin(D131);
%var_bin(A132);	%var_bin(S132);	%var_bin(M132);	%var_bin(D132);
%var_bin(A133);	%var_bin(S133);	%var_bin(M133);	%var_bin(D133);
%var_bin(A134);	%var_bin(S134);	%var_bin(M134);	%var_bin(D134);
%var_bin(A135);	%var_bin(S135);	%var_bin(M135);	%var_bin(D135);
%var_bin(A136);	%var_bin(S136);	%var_bin(M136);	%var_bin(D136);
%var_bin(A137);	%var_bin(S137);	%var_bin(M137);	%var_bin(D137);
%var_bin(A138);	%var_bin(S138);	%var_bin(M138);	%var_bin(D138);
%var_bin(A139);	%var_bin(S139);	%var_bin(M139);	%var_bin(D139);
%var_bin(A140);	%var_bin(S140);	%var_bin(M140);	%var_bin(D140);
%var_bin(A141);	%var_bin(S141);	%var_bin(M141);	%var_bin(D141);
%var_bin(A142);	%var_bin(S142);	%var_bin(M142);	%var_bin(D142);
%var_bin(A143);	%var_bin(S143);	%var_bin(M143);	%var_bin(D143);
%var_bin(A144);	%var_bin(S144);	%var_bin(M144);	%var_bin(D144);
%var_bin(A145);	%var_bin(S145);	%var_bin(M145);	%var_bin(D145);
%var_bin(A146);	%var_bin(S146);	%var_bin(M146);	%var_bin(D146);
%var_bin(A147);	%var_bin(S147);	%var_bin(M147);	%var_bin(D147);
%var_bin(A148);	%var_bin(S148);	%var_bin(M148);	%var_bin(D148);
%var_bin(A149);	%var_bin(S149);	%var_bin(M149);	%var_bin(D149);
%var_bin(A150);	%var_bin(S150);	%var_bin(M150);	%var_bin(D150);
%var_bin(A151);	%var_bin(S151);	%var_bin(M151);	%var_bin(D151);
%var_bin(A152);	%var_bin(S152);	%var_bin(M152);	%var_bin(D152);
%var_bin(A153);	%var_bin(S153);	%var_bin(M153);	%var_bin(D153);
%var_bin(A154);	%var_bin(S154);	%var_bin(M154);	%var_bin(D154);
%var_bin(A155);	%var_bin(S155);	%var_bin(M155);	%var_bin(D155);
%var_bin(A156);	%var_bin(S156);	%var_bin(M156);	%var_bin(D156);
%var_bin(A157);	%var_bin(S157);	%var_bin(M157);	%var_bin(D157);
%var_bin(A158);	%var_bin(S158);	%var_bin(M158);	%var_bin(D158);
%var_bin(A159);	%var_bin(S159);	%var_bin(M159);	%var_bin(D159);
%var_bin(A160);	%var_bin(S160);	%var_bin(M160);	%var_bin(D160);
%var_bin(A161);	%var_bin(S161);	%var_bin(M161);	%var_bin(D161);
%var_bin(A162);	%var_bin(S162);	%var_bin(M162);	%var_bin(D162);
%var_bin(A163);	%var_bin(S163);	%var_bin(M163);	%var_bin(D163);
%var_bin(A164);	%var_bin(S164);	%var_bin(M164);	%var_bin(D164);
%var_bin(A165);	%var_bin(S165);	%var_bin(M165);	%var_bin(D165);
%var_bin(A166);	%var_bin(S166);	%var_bin(M166);	%var_bin(D166);
%var_bin(A167);	%var_bin(S167);	%var_bin(M167);	%var_bin(D167);
%var_bin(A168);	%var_bin(S168);	%var_bin(M168);	%var_bin(D168);
%var_bin(A169);	%var_bin(S169);	%var_bin(M169);	%var_bin(D169);
%var_bin(A170);	%var_bin(S170);	%var_bin(M170);	%var_bin(D170);
%var_bin(A171);	%var_bin(S171);	%var_bin(M171);	%var_bin(D171);
%var_bin(A172);	%var_bin(S172);	%var_bin(M172);	%var_bin(D172);
%var_bin(A173);	%var_bin(S173);	%var_bin(M173);	%var_bin(D173);
%var_bin(A174);	%var_bin(S174);	%var_bin(M174);	%var_bin(D174);
%var_bin(A175);	%var_bin(S175);	%var_bin(M175);	%var_bin(D175);
%var_bin(A176);	%var_bin(S176);	%var_bin(M176);	%var_bin(D176);
%var_bin(A177);	%var_bin(S177);	%var_bin(M177);	%var_bin(D177);
%var_bin(A178);	%var_bin(S178);	%var_bin(M178);	%var_bin(D178);
%var_bin(A179);	%var_bin(S179);	%var_bin(M179);	%var_bin(D179);
%var_bin(A180);	%var_bin(S180);	%var_bin(M180);	%var_bin(D180);
%var_bin(A181);	%var_bin(S181);	%var_bin(M181);	%var_bin(D181);
%var_bin(A182);	%var_bin(S182);	%var_bin(M182);	%var_bin(D182);
%var_bin(A183);	%var_bin(S183);	%var_bin(M183);	%var_bin(D183);
%var_bin(A184);	%var_bin(S184);	%var_bin(M184);	%var_bin(D184);
%var_bin(A185);	%var_bin(S185);	%var_bin(M185);	%var_bin(D185);
%var_bin(A186);	%var_bin(S186);	%var_bin(M186);	%var_bin(D186);
%var_bin(A187);	%var_bin(S187);	%var_bin(M187);	%var_bin(D187);
%var_bin(A188);	%var_bin(S188);	%var_bin(M188);	%var_bin(D188);
%var_bin(A189);	%var_bin(S189);	%var_bin(M189);	%var_bin(D189);
%var_bin(A190);	%var_bin(S190);	%var_bin(M190);	%var_bin(D190);
%var_bin(A191);	%var_bin(S191);	%var_bin(M191);	%var_bin(D191);
%var_bin(A192);	%var_bin(S192);	%var_bin(M192);	%var_bin(D192);
%var_bin(A193);	%var_bin(S193);	%var_bin(M193);	%var_bin(D193);
%var_bin(A194);	%var_bin(S194);	%var_bin(M194);	%var_bin(D194);
%var_bin(A195);	%var_bin(S195);	%var_bin(M195);	%var_bin(D195);
%var_bin(A196);	%var_bin(S196);	%var_bin(M196);	%var_bin(D196);
%var_bin(A197);	%var_bin(S197);	%var_bin(M197);	%var_bin(D197);
%var_bin(A198);	%var_bin(S198);	%var_bin(M198);	%var_bin(D198);
%var_bin(A199);	%var_bin(S199);	%var_bin(M199);	%var_bin(D199);
%var_bin(A200);	%var_bin(S200);	%var_bin(M200);	%var_bin(D200);
%var_bin(A201);	%var_bin(S201);	%var_bin(M201);	%var_bin(D201);
%var_bin(A202);	%var_bin(S202);	%var_bin(M202);	%var_bin(D202);
%var_bin(A203);	%var_bin(S203);	%var_bin(M203);	%var_bin(D203);
%var_bin(A204);	%var_bin(S204);	%var_bin(M204);	%var_bin(D204);
%var_bin(A205);	%var_bin(S205);	%var_bin(M205);	%var_bin(D205);
%var_bin(A206);	%var_bin(S206);	%var_bin(M206);	%var_bin(D206);
%var_bin(A207);	%var_bin(S207);	%var_bin(M207);	%var_bin(D207);
%var_bin(A208);	%var_bin(S208);	%var_bin(M208);	%var_bin(D208);
%var_bin(A209);	%var_bin(S209);	%var_bin(M209);	%var_bin(D209);
%var_bin(A210);	%var_bin(S210);	%var_bin(M210);	%var_bin(D210);
%var_bin(A211);	%var_bin(S211);	%var_bin(M211);	%var_bin(D211);
%var_bin(A212);	%var_bin(S212);	%var_bin(M212);	%var_bin(D212);
%var_bin(A213);	%var_bin(S213);	%var_bin(M213);	%var_bin(D213);
%var_bin(A214);	%var_bin(S214);	%var_bin(M214);	%var_bin(D214);
%var_bin(A215);	%var_bin(S215);	%var_bin(M215);	%var_bin(D215);
%var_bin(A216);	%var_bin(S216);	%var_bin(M216);	%var_bin(D216);
%var_bin(A217);	%var_bin(S217);	%var_bin(M217);	%var_bin(D217);
%var_bin(A218);	%var_bin(S218);	%var_bin(M218);	%var_bin(D218);
%var_bin(A219);	%var_bin(S219);	%var_bin(M219);	%var_bin(D219);
%var_bin(A220);	%var_bin(S220);	%var_bin(M220);	%var_bin(D220);
%var_bin(A221);	%var_bin(S221);	%var_bin(M221);	%var_bin(D221);
%var_bin(A222);	%var_bin(S222);	%var_bin(M222);	%var_bin(D222);
%var_bin(A223);	%var_bin(S223);	%var_bin(M223);	%var_bin(D223);
%var_bin(A224);	%var_bin(S224);	%var_bin(M224);	%var_bin(D224);
%var_bin(A225);	%var_bin(S225);	%var_bin(M225);	%var_bin(D225);
%var_bin(A226);	%var_bin(S226);	%var_bin(M226);	%var_bin(D226);
%var_bin(A227);	%var_bin(S227);	%var_bin(M227);	%var_bin(D227);
%var_bin(A228);	%var_bin(S228);	%var_bin(M228);	%var_bin(D228);
%var_bin(A229);	%var_bin(S229);	%var_bin(M229);	%var_bin(D229);
%var_bin(A230);	%var_bin(S230);	%var_bin(M230);	%var_bin(D230);
%var_bin(A231);	%var_bin(S231);	%var_bin(M231);	%var_bin(D231);
%var_bin(A232);	%var_bin(S232);	%var_bin(M232);	%var_bin(D232);
%var_bin(A233);	%var_bin(S233);	%var_bin(M233);	%var_bin(D233);
%var_bin(A234);	%var_bin(S234);	%var_bin(M234);	%var_bin(D234);
%var_bin(A235);	%var_bin(S235);	%var_bin(M235);	%var_bin(D235);
%var_bin(A236);	%var_bin(S236);	%var_bin(M236);	%var_bin(D236);
%var_bin(A237);	%var_bin(S237);	%var_bin(M237);	%var_bin(D237);
%var_bin(A238);	%var_bin(S238);	%var_bin(M238);	%var_bin(D238);
%var_bin(A239);	%var_bin(S239);	%var_bin(M239);	%var_bin(D239);
%var_bin(A240);	%var_bin(S240);	%var_bin(M240);	%var_bin(D240);
%var_bin(A241);	%var_bin(S241);	%var_bin(M241);	%var_bin(D241);
%var_bin(A242);	%var_bin(S242);	%var_bin(M242);	%var_bin(D242);
%var_bin(A243);	%var_bin(S243);	%var_bin(M243);	%var_bin(D243);
%var_bin(A244);	%var_bin(S244);	%var_bin(M244);	%var_bin(D244);
%var_bin(A245);	%var_bin(S245);	%var_bin(M245);	%var_bin(D245);
%var_bin(A246);	%var_bin(S246);	%var_bin(M246);	%var_bin(D246);
%var_bin(A247);	%var_bin(S247);	%var_bin(M247);	%var_bin(D247);
%var_bin(A248);	%var_bin(S248);	%var_bin(M248);	%var_bin(D248);
%var_bin(A249);	%var_bin(S249);	%var_bin(M249);	%var_bin(D249);
%var_bin(A250);	%var_bin(S250);	%var_bin(M250);	%var_bin(D250);
%var_bin(A251);	%var_bin(S251);	%var_bin(M251);	%var_bin(D251);
%var_bin(A252);	%var_bin(S252);	%var_bin(M252);	%var_bin(D252);
%var_bin(A253);	%var_bin(S253);	%var_bin(M253);	%var_bin(D253);
%var_bin(A254);	%var_bin(S254);	%var_bin(M254);	%var_bin(D254);
%var_bin(A255);	%var_bin(S255);	%var_bin(M255);	%var_bin(D255);
%var_bin(A256);	%var_bin(S256);	%var_bin(M256);	%var_bin(D256);
%var_bin(A257);	%var_bin(S257);	%var_bin(M257);	%var_bin(D257);
%var_bin(A258);	%var_bin(S258);	%var_bin(M258);	%var_bin(D258);
%var_bin(A259);	%var_bin(S259);	%var_bin(M259);	%var_bin(D259);
%var_bin(A260);	%var_bin(S260);	%var_bin(M260);	%var_bin(D260);
%var_bin(A261);	%var_bin(S261);	%var_bin(M261);	%var_bin(D261);
%var_bin(A262);	%var_bin(S262);	%var_bin(M262);	%var_bin(D262);
%var_bin(A263);	%var_bin(S263);	%var_bin(M263);	%var_bin(D263);
%var_bin(A264);	%var_bin(S264);	%var_bin(M264);	%var_bin(D264);
%var_bin(A265);	%var_bin(S265);	%var_bin(M265);	%var_bin(D265);
%var_bin(A266);	%var_bin(S266);	%var_bin(M266);	%var_bin(D266);
%var_bin(A267);	%var_bin(S267);	%var_bin(M267);	%var_bin(D267);
%var_bin(A268);	%var_bin(S268);	%var_bin(M268);	%var_bin(D268);
%var_bin(A269);	%var_bin(S269);	%var_bin(M269);	%var_bin(D269);
%var_bin(A270);	%var_bin(S270);	%var_bin(M270);	%var_bin(D270);
%var_bin(A271);	%var_bin(S271);	%var_bin(M271);	%var_bin(D271);
%var_bin(A272);	%var_bin(S272);	%var_bin(M272);	%var_bin(D272);
%var_bin(A273);	%var_bin(S273);	%var_bin(M273);	%var_bin(D273);
%var_bin(A274);	%var_bin(S274);	%var_bin(M274);	%var_bin(D274);
%var_bin(A275);	%var_bin(S275);	%var_bin(M275);	%var_bin(D275);
%var_bin(A276);	%var_bin(S276);	%var_bin(M276);	%var_bin(D276);
%var_bin(A277);	%var_bin(S277);	%var_bin(M277);	%var_bin(D277);
%var_bin(A278);	%var_bin(S278);	%var_bin(M278);	%var_bin(D278);
%var_bin(A279);	%var_bin(S279);	%var_bin(M279);	%var_bin(D279);
%var_bin(A280);	%var_bin(S280);	%var_bin(M280);	%var_bin(D280);
%var_bin(A281);	%var_bin(S281);	%var_bin(M281);	%var_bin(D281);
%var_bin(A282);	%var_bin(S282);	%var_bin(M282);	%var_bin(D282);
%var_bin(A283);	%var_bin(S283);	%var_bin(M283);	%var_bin(D283);
%var_bin(A284);	%var_bin(S284);	%var_bin(M284);	%var_bin(D284);
%var_bin(A285);	%var_bin(S285);	%var_bin(M285);	%var_bin(D285);
%var_bin(A286);	%var_bin(S286);	%var_bin(M286);	%var_bin(D286);
%var_bin(A287);	%var_bin(S287);	%var_bin(M287);	%var_bin(D287);
%var_bin(A288);	%var_bin(S288);	%var_bin(M288);	%var_bin(D288);
%var_bin(A289);	%var_bin(S289);	%var_bin(M289);	%var_bin(D289);
%var_bin(A290);	%var_bin(S290);	%var_bin(M290);	%var_bin(D290);
%var_bin(A291);	%var_bin(S291);	%var_bin(M291);	%var_bin(D291);
%var_bin(A292);	%var_bin(S292);	%var_bin(M292);	%var_bin(D292);
%var_bin(A293);	%var_bin(S293);	%var_bin(M293);	%var_bin(D293);
%var_bin(A294);	%var_bin(S294);	%var_bin(M294);	%var_bin(D294);
%var_bin(A295);	%var_bin(S295);	%var_bin(M295);	%var_bin(D295);
%var_bin(A296);	%var_bin(S296);	%var_bin(M296);	%var_bin(D296);
%var_bin(A297);	%var_bin(S297);	%var_bin(M297);	%var_bin(D297);
%var_bin(A298);	%var_bin(S298);	%var_bin(M298);	%var_bin(D298);
%var_bin(A299);	%var_bin(S299);	%var_bin(M299);	%var_bin(D299);
%var_bin(A300);	%var_bin(S300);	%var_bin(M300);	%var_bin(D300);
%var_bin(A301);	%var_bin(S301);	%var_bin(M301);	%var_bin(D301);
%var_bin(A302);	%var_bin(S302);	%var_bin(M302);	%var_bin(D302);
%var_bin(A303);	%var_bin(S303);	%var_bin(M303);	%var_bin(D303);
%var_bin(A304);	%var_bin(S304);	%var_bin(M304);	%var_bin(D304);
%var_bin(A305);	%var_bin(S305);	%var_bin(M305);	%var_bin(D305);
%var_bin(A306);	%var_bin(S306);	%var_bin(M306);	%var_bin(D306);
%var_bin(A307);	%var_bin(S307);	%var_bin(M307);	%var_bin(D307);
%var_bin(A308);	%var_bin(S308);	%var_bin(M308);	%var_bin(D308);
%var_bin(A309);	%var_bin(S309);	%var_bin(M309);	%var_bin(D309);
%var_bin(A310);	%var_bin(S310);	%var_bin(M310);	%var_bin(D310);
%var_bin(A311);	%var_bin(S311);	%var_bin(M311);	%var_bin(D311);
%var_bin(A312);	%var_bin(S312);	%var_bin(M312);	%var_bin(D312);
%var_bin(A313);	%var_bin(S313);	%var_bin(M313);	%var_bin(D313);
%var_bin(A314);	%var_bin(S314);	%var_bin(M314);	%var_bin(D314);
%var_bin(A315);	%var_bin(S315);	%var_bin(M315);	%var_bin(D315);
%var_bin(A316);	%var_bin(S316);	%var_bin(M316);	%var_bin(D316);
%var_bin(A317);	%var_bin(S317);	%var_bin(M317);	%var_bin(D317);
%var_bin(A318);	%var_bin(S318);	%var_bin(M318);	%var_bin(D318);
%var_bin(A319);	%var_bin(S319);	%var_bin(M319);	%var_bin(D319);
%var_bin(A320);	%var_bin(S320);	%var_bin(M320);	%var_bin(D320);
%var_bin(A321);	%var_bin(S321);	%var_bin(M321);	%var_bin(D321);
%var_bin(A322);	%var_bin(S322);	%var_bin(M322);	%var_bin(D322);
%var_bin(A323);	%var_bin(S323);	%var_bin(M323);	%var_bin(D323);
%var_bin(A324);	%var_bin(S324);	%var_bin(M324);	%var_bin(D324);
%var_bin(A325);	%var_bin(S325);	%var_bin(M325);	%var_bin(D325);
%var_bin(A326);	%var_bin(S326);	%var_bin(M326);	%var_bin(D326);
%var_bin(A327);	%var_bin(S327);	%var_bin(M327);	%var_bin(D327);
%var_bin(A328);	%var_bin(S328);	%var_bin(M328);	%var_bin(D328);
%var_bin(A329);	%var_bin(S329);	%var_bin(M329);	%var_bin(D329);
%var_bin(A330);	%var_bin(S330);	%var_bin(M330);	%var_bin(D330);
%var_bin(A331);	%var_bin(S331);	%var_bin(M331);	%var_bin(D331);
%var_bin(A332);	%var_bin(S332);	%var_bin(M332);	%var_bin(D332);
%var_bin(A333);	%var_bin(S333);	%var_bin(M333);	%var_bin(D333);
%var_bin(A334);	%var_bin(S334);	%var_bin(M334);	%var_bin(D334);
%var_bin(A335);	%var_bin(S335);	%var_bin(M335);	%var_bin(D335);
%var_bin(A336);	%var_bin(S336);	%var_bin(M336);	%var_bin(D336);
%var_bin(A337);	%var_bin(S337);	%var_bin(M337);	%var_bin(D337);
%var_bin(A338);	%var_bin(S338);	%var_bin(M338);	%var_bin(D338);
%var_bin(A339);	%var_bin(S339);	%var_bin(M339);	%var_bin(D339);
%var_bin(A340);	%var_bin(S340);	%var_bin(M340);	%var_bin(D340);
%var_bin(A341);	%var_bin(S341);	%var_bin(M341);	%var_bin(D341);
%var_bin(A342);	%var_bin(S342);	%var_bin(M342);	%var_bin(D342);
%var_bin(A343);	%var_bin(S343);	%var_bin(M343);	%var_bin(D343);
%var_bin(A344);	%var_bin(S344);	%var_bin(M344);	%var_bin(D344);
%var_bin(A345);	%var_bin(S345);	%var_bin(M345);	%var_bin(D345);
%var_bin(A346);	%var_bin(S346);	%var_bin(M346);	%var_bin(D346);
%var_bin(A347);	%var_bin(S347);	%var_bin(M347);	%var_bin(D347);
%var_bin(A348);	%var_bin(S348);	%var_bin(M348);	%var_bin(D348);
%var_bin(A349);	%var_bin(S349);	%var_bin(M349);	%var_bin(D349);
%var_bin(A350);	%var_bin(S350);	%var_bin(M350);	%var_bin(D350);
%var_bin(A351);	%var_bin(S351);	%var_bin(M351);	%var_bin(D351);
%var_bin(A352);	%var_bin(S352);	%var_bin(M352);	%var_bin(D352);
%var_bin(A353);	%var_bin(S353);	%var_bin(M353);	%var_bin(D353);
%var_bin(A354);	%var_bin(S354);	%var_bin(M354);	%var_bin(D354);
%var_bin(A355);	%var_bin(S355);	%var_bin(M355);	%var_bin(D355);
%var_bin(A356);	%var_bin(S356);	%var_bin(M356);	%var_bin(D356);
%var_bin(A357);	%var_bin(S357);	%var_bin(M357);	%var_bin(D357);
%var_bin(A358);	%var_bin(S358);	%var_bin(M358);	%var_bin(D358);
%var_bin(A359);	%var_bin(S359);	%var_bin(M359);	%var_bin(D359);
%var_bin(A360);	%var_bin(S360);	%var_bin(M360);	%var_bin(D360);
%var_bin(A361);	%var_bin(S361);	%var_bin(M361);	%var_bin(D361);
%var_bin(A362);	%var_bin(S362);	%var_bin(M362);	%var_bin(D362);
%var_bin(A363);	%var_bin(S363);	%var_bin(M363);	%var_bin(D363);
%var_bin(A364);	%var_bin(S364);	%var_bin(M364);	%var_bin(D364);
%var_bin(A365);	%var_bin(S365);	%var_bin(M365);	%var_bin(D365);
%var_bin(A366);	%var_bin(S366);	%var_bin(M366);	%var_bin(D366);
%var_bin(A367);	%var_bin(S367);	%var_bin(M367);	%var_bin(D367);
%var_bin(A368);	%var_bin(S368);	%var_bin(M368);	%var_bin(D368);
%var_bin(A369);	%var_bin(S369);	%var_bin(M369);	%var_bin(D369);
%var_bin(A370);	%var_bin(S370);	%var_bin(M370);	%var_bin(D370);
%var_bin(A371);	%var_bin(S371);	%var_bin(M371);	%var_bin(D371);
%var_bin(A372);	%var_bin(S372);	%var_bin(M372);	%var_bin(D372);
%var_bin(A373);	%var_bin(S373);	%var_bin(M373);	%var_bin(D373);
%var_bin(A374);	%var_bin(S374);	%var_bin(M374);	%var_bin(D374);
%var_bin(A375);	%var_bin(S375);	%var_bin(M375);	%var_bin(D375);
%var_bin(A376);	%var_bin(S376);	%var_bin(M376);	%var_bin(D376);
%var_bin(A377);	%var_bin(S377);	%var_bin(M377);	%var_bin(D377);
%var_bin(A378);	%var_bin(S378);	%var_bin(M378);	%var_bin(D378);
%var_bin(A379);	%var_bin(S379);	%var_bin(M379);	%var_bin(D379);
%var_bin(A380);	%var_bin(S380);	%var_bin(M380);	%var_bin(D380);
%var_bin(A381);	%var_bin(S381);	%var_bin(M381);	%var_bin(D381);
%var_bin(A382);	%var_bin(S382);	%var_bin(M382);	%var_bin(D382);
%var_bin(A383);	%var_bin(S383);	%var_bin(M383);	%var_bin(D383);
%var_bin(A384);	%var_bin(S384);	%var_bin(M384);	%var_bin(D384);
%var_bin(A385);	%var_bin(S385);	%var_bin(M385);	%var_bin(D385);
%var_bin(A386);	%var_bin(S386);	%var_bin(M386);	%var_bin(D386);
%var_bin(A387);	%var_bin(S387);	%var_bin(M387);	%var_bin(D387);
%var_bin(A388);	%var_bin(S388);	%var_bin(M388);	%var_bin(D388);
%var_bin(A389);	%var_bin(S389);	%var_bin(M389);	%var_bin(D389);
%var_bin(A390);	%var_bin(S390);	%var_bin(M390);	%var_bin(D390);
%var_bin(A391);	%var_bin(S391);	%var_bin(M391);	%var_bin(D391);
%var_bin(A392);	%var_bin(S392);	%var_bin(M392);	%var_bin(D392);
%var_bin(A393);	%var_bin(S393);	%var_bin(M393);	%var_bin(D393);
%var_bin(A394);	%var_bin(S394);	%var_bin(M394);	%var_bin(D394);
%var_bin(A395);	%var_bin(S395);	%var_bin(M395);	%var_bin(D395);
%var_bin(A396);	%var_bin(S396);	%var_bin(M396);	%var_bin(D396);
%var_bin(A397);	%var_bin(S397);	%var_bin(M397);	%var_bin(D397);
%var_bin(A398);	%var_bin(S398);	%var_bin(M398);	%var_bin(D398);
%var_bin(A399);	%var_bin(S399);	%var_bin(M399);	%var_bin(D399);
%var_bin(A400);	%var_bin(S400);	%var_bin(M400);	%var_bin(D400);
%var_bin(A401);	%var_bin(S401);	%var_bin(M401);	%var_bin(D401);
%var_bin(A402);	%var_bin(S402);	%var_bin(M402);	%var_bin(D402);
%var_bin(A403);	%var_bin(S403);	%var_bin(M403);	%var_bin(D403);
%var_bin(A404);	%var_bin(S404);	%var_bin(M404);	%var_bin(D404);
%var_bin(A405);	%var_bin(S405);	%var_bin(M405);	%var_bin(D405);
%var_bin(A406);	%var_bin(S406);	%var_bin(M406);	%var_bin(D406);
proc contents data=rg.creditcard; run;
