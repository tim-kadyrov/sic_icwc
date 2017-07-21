
*******************************************************



$ontext
В данной части кода объявляются множества элементов, с которыми будем работать далее
$offtext

$ontext
set

        crops Множество культур
         /
         cotton          хлопок
         grape           виноград
         fruits          садовые культуры
         vegetable       овощные культуры
         melon           бахчевые культуры
         CornGrain       зерновые культуры
         rise            рис
         lucerne         люцерна
         corn            кукуруза
         potato          картофель
         grain           ??
         silage          ??
         /
$offtext

set

        crops Множество культур
         /
         cotton          хлопчатник
         wheat           пшеница
         rice            рис
         maize           кукуруза на зерно
         vegetable       овощные
         orchards        Фруктовые сады и виноградники
         forage          кормовые (corn silage и люцерна)
         other           Прочие другие зерновые и технические - oil crops
         homestead       приусадебные
         /


        cattle Множество скота
         /
         beef_cattle     крупнорогатый скот для производства мяса
         dairy_cattle    крупнорогатый скот для производства молока
         sheep_goat      бараны\козы
         poultry         птицы
         pig             свиньи
         /


        beef(cattle) подможество скота для производства мяса
         /
         beef_cattle
         sheep_goat
         poultry
         pig
         /

        roughage(crops) подмножество культур - грубые корма  /cotton, wheat, rice, maize/

        feed(crops)     подмножество культур - мягкие корма  /forage, vegetable, maize/



        OutputData   список данных для вывода
         /
         FeedMassOutput          Кормовая масса
         FeedUnitOutput          Кормовые единицы
         TotalYieldOutput        Валовый сбор культур
         IncomeOutput            Доход
         ExpensesOutput          Затраты
         WagesOutput             З\п
         TaxOutput               Налоги
         ProfitOutput            Прибыль
         AddedTaxOutput          Добавленная стоимость
         AreaOutputModel1        Использованная площадь после расчета первой модели   (Оптимизация продовольственной корзины)
         AreaOutputModel2        Использованная площадь после расчета второй модели   (Оптимизация экспортного потенциала - второй этап)
         AreaOutputModel3        Использованная площадь после расчета третьей модели  (Оптимизация по критерию "Каллории")
         TotalYieldWoInn         Валовый сбор с площади без использования инноваций
         In_Productivity         Площадь на которой задействованы инновации для повышения урожайности
         In_WaterRate            Площадь на которой задействованы иноовации для уменьшения водопотребления
         /


        Set_Parameters
         /
         SpecFactAmFr                Удельный показатель количества садовых
         SpecFactAmVg                Удельный показатель количества овощных
         SpecFactAmBrd               Удельный показатель количества зерновых
         Amount_Water                Количество воды
         Feed_Cal                    Мягкие корма при калибровке модели
         Roughage_Cal                Грубые корма при калибровке модели
         FactAmFruits            Фактический сбор садовых
         FactAmVeg               Фактический сбор овощных
         FactAmBread             Фактический сбор зерновых
         Area                        Площадь ЗП
         Population                  Население
         MilkUnit                    Единицы молока
         std_Milk                    Норма молока
         std_Meat                    Норма мяса
         std_Fruit                   Норма садовых
         std_Bread                   Норма зерновых
         std_Veg                     Норма овощных
         FactProdMilk                Фактическое производство молока
         FactProdMeat                Фактическое производство мяса
         pc_mol                      Остальные параметры пока не задействованы
         pc_meat
         pc_fr
         pc_veg
         pc_hl
         ras_potr
         k_meat
         k_milk
         k_veg
         k_fr
         k_hl
         k_norm
         k_n_god
         pro_meat
         pro_milk
         /;

*******************************************************



*******************************************************

$ontext
В данной части программы импортируются данные из СУБД MySQL. Для корректной работы модуля необходимо изменить путь в строке O="...", на путь, в котором находится исполняемые файл .gms
Затем сменить путь к файлу в строке "$include ..."
$offtext

parameter productivity(crops)
/
$call =sql2gms C="DRIVER=MySQL ODBC 5.3 ANSI Driver; Server=localhost; Database=gams; UID =root;" Q="SELECT crops, productivity FROM crops" O="C:\Users\tima0\Documents\gamsdir\projdir\productivity.inc"
$include C:\Users\tima0\Documents\gamsdir\projdir\productivity.inc
/;
parameter Calibration_Feed_Unit(crops)
/
$call =sql2gms C="DRIVER=MySQL ODBC 5.3 ANSI Driver; Server=localhost; Database=gams; UID =root;" Q="SELECT crops, calibration_feed_unit FROM `crops`" O="C:\Users\tima0\Documents\gamsdir\projdir\Calibration_Feed_Unit.inc"
$include C:\Users\tima0\Documents\gamsdir\projdir\Calibration_Feed_Unit.inc
/;
parameter FeedUnitCoef(crops)
/
$call =sql2gms C="DRIVER=MySQL ODBC 5.3 ANSI Driver; Server=localhost; Database=gams; UID =root;" Q="SELECT crops, FeedUnitCoef FROM `crops`" O="C:\Users\tima0\Documents\gamsdir\projdir\FeedUnitCoef.inc"
$include C:\Users\tima0\Documents\gamsdir\projdir\FeedUnitCoef.inc
/;
parameter Fact_Area(crops)
/
$call =sql2gms C="DRIVER=MySQL ODBC 5.3 ANSI Driver; Server=localhost; Database=gams; UID =root;" Q="SELECT crops, Fact_Area FROM `crops`" O="C:\Users\tima0\Documents\gamsdir\projdir\Fact_Area.inc"
$include C:\Users\tima0\Documents\gamsdir\projdir\Fact_Area.inc
/;
parameter FeedMassCoef(crops)
/
$call =sql2gms C="DRIVER=MySQL ODBC 5.3 ANSI Driver; Server=localhost; Database=gams; UID =root;" Q="SELECT crops, FeedMassCoef FROM `crops`" O="C:\Users\tima0\Documents\gamsdir\projdir\FeedMassCoef.inc"
$include C:\Users\tima0\Documents\gamsdir\projdir\FeedMassCoef.inc
/;
parameter WaterRate(crops)
/
$call =sql2gms C="DRIVER=MySQL ODBC 5.3 ANSI Driver; Server=localhost; Database=gams; UID =root;" Q="SELECT crops, WaterRate FROM `crops`" O="C:\Users\tima0\Documents\gamsdir\projdir\WaterRate.inc"
$include C:\Users\tima0\Documents\gamsdir\projdir\WaterRate.inc
/;
parameter Cost(crops)
/
$call =sql2gms C="DRIVER=MySQL ODBC 5.3 ANSI Driver; Server=localhost; Database=gams; UID =root;" Q="SELECT crops, Cost FROM `crops`" O="C:\Users\tima0\Documents\gamsdir\projdir\Cost.inc"
$include C:\Users\tima0\Documents\gamsdir\projdir\Cost.inc
/;
parameter Coef_Expenses(crops)
/
$call =sql2gms C="DRIVER=MySQL ODBC 5.3 ANSI Driver; Server=localhost; Database=gams; UID =root;" Q="SELECT crops, Coef_Expenses FROM `crops`" O="C:\Users\tima0\Documents\gamsdir\projdir\Coef_Expenses.inc"
$include C:\Users\tima0\Documents\gamsdir\projdir\Coef_Expenses.inc
/;
parameter Wages(crops)
/
$call =sql2gms C="DRIVER=MySQL ODBC 5.3 ANSI Driver; Server=localhost; Database=gams; UID =root;" Q="SELECT crops, Wages FROM `crops`" O="C:\Users\tima0\Documents\gamsdir\projdir\Wages.inc"
$include C:\Users\tima0\Documents\gamsdir\projdir\Wages.inc
/;
parameter Tax(crops)
/
$call =sql2gms C="DRIVER=MySQL ODBC 5.3 ANSI Driver; Server=localhost; Database=gams; UID =root;" Q="SELECT crops, Tax FROM `crops`" O="C:\Users\tima0\Documents\gamsdir\projdir\Tax.inc"
$include C:\Users\tima0\Documents\gamsdir\projdir\Tax.inc
/;
parameter Conversion(crops)
/
$call =sql2gms C="DRIVER=MySQL ODBC 5.3 ANSI Driver; Server=localhost; Database=gams; UID =root;" Q="SELECT crops, Conversion FROM `crops`" O="C:\Users\tima0\Documents\gamsdir\projdir\Conversion.inc"
$include C:\Users\tima0\Documents\gamsdir\projdir\Conversion.inc
/;
parameter Inn_Productivity(crops)
/
$call =sql2gms C="DRIVER=MySQL ODBC 5.3 ANSI Driver; Server=localhost; Database=gams; UID =root;" Q="SELECT crops, Inn_Productivity FROM `crops`" O="C:\Users\tima0\Documents\gamsdir\projdir\Inn_Productivity.inc"
$include C:\Users\tima0\Documents\gamsdir\projdir\Inn_Productivity.inc
/;
parameter Inn_Area(crops)
/
$call =sql2gms C="DRIVER=MySQL ODBC 5.3 ANSI Driver; Server=localhost; Database=gams; UID =root;" Q="SELECT crops, Inn_Area FROM `crops`" O="C:\Users\tima0\Documents\gamsdir\projdir\Inn_Area.inc"
$include C:\Users\tima0\Documents\gamsdir\projdir\Inn_Area.inc
/;
parameter Inn_WaterRate(crops)
/
$call =sql2gms C="DRIVER=MySQL ODBC 5.3 ANSI Driver; Server=localhost; Database=gams; UID =root;" Q="SELECT crops, Inn_WaterRate FROM `crops`" O="C:\Users\tima0\Documents\gamsdir\projdir\Inn_WaterRate.inc"
$include C:\Users\tima0\Documents\gamsdir\projdir\Inn_WaterRate.inc
/;

parameter reuse_factor(crops)
/
$call =sql2gms C="DRIVER=MySQL ODBC 5.3 ANSI Driver; Server=localhost; Database=gams; UID =root;" Q="SELECT crops, reuse_factor FROM `crops`" O="C:\Users\tima0\Documents\gamsdir\projdir\reuse_factor.inc"
$include C:\Users\tima0\Documents\gamsdir\projdir\reuse_factor.inc
/;
****************************************************

parameter Coeff(cattle)
/
$call =sql2gms C="DRIVER=MySQL ODBC 5.3 ANSI Driver; Server=localhost; Database=gams; UID =root;" Q="SELECT cattle, Coeff FROM `cattle`" O="C:\Users\tima0\Documents\gamsdir\projdir\Coeff.inc"
$include C:\Users\tima0\Documents\gamsdir\projdir\Coeff.inc
/;
parameter Cattle_FeedUnit(cattle)
/
$call =sql2gms C="DRIVER=MySQL ODBC 5.3 ANSI Driver; Server=localhost; Database=gams; UID =root;" Q="SELECT cattle, Cattle_FeedUnit FROM `cattle`" O="C:\Users\tima0\Documents\gamsdir\projdir\Cattle_FeedUnit.inc"
$include C:\Users\tima0\Documents\gamsdir\projdir\Cattle_FeedUnit.inc
/;
parameter CattleNorm(cattle)
/
$call =sql2gms C="DRIVER=MySQL ODBC 5.3 ANSI Driver; Server=localhost; Database=gams; UID =root;" Q="SELECT cattle, CattleNorm FROM `cattle`" O="C:\Users\tima0\Documents\gamsdir\projdir\CattleNorm.inc"
$include C:\Users\tima0\Documents\gamsdir\projdir\CattleNorm.inc
/;
parameter Consumption(cattle)
/
$call =sql2gms C="DRIVER=MySQL ODBC 5.3 ANSI Driver; Server=localhost; Database=gams; UID =root;" Q="SELECT cattle, Consumption FROM `cattle`" O="C:\Users\tima0\Documents\gamsdir\projdir\Consumption.inc"
$include C:\Users\tima0\Documents\gamsdir\projdir\Consumption.inc
/;
parameter Amount(cattle)
/
$call =sql2gms C="DRIVER=MySQL ODBC 5.3 ANSI Driver; Server=localhost; Database=gams; UID =root;" Q="SELECT cattle, Amount FROM `cattle`" O="C:\Users\tima0\Documents\gamsdir\projdir\Amount.inc"
$include C:\Users\tima0\Documents\gamsdir\projdir\Amount.inc
/;

*****************************************************

table OutputTable(crops, OutputData)
                FeedMassOutput FeedUnitOutput       TotalYieldOutput  IncomeOutput   ExpensesOutput WagesOutput
cotton
orchards
vegetable
wheat
rice
forage
maize


+               TaxOutput  ProfitOutput  AddedTaxOutput  AreaOutputModel1    AreaOutputModel2 AreaOutputModel3    TotalYieldWoInn      In_Productivity   In_WaterRate

cotton
orchards
vegetable
wheat
rice
forage
maize


parameter par(Set_Parameters)
/
$call =sql2gms C="DRIVER=MySQL ODBC 5.3 ANSI Driver; Server=localhost; Database=gams; UID =root;" Q="SELECT * FROM `par`" O="C:\Users\tima0\Documents\gamsdir\projdir\par.inc"
$include C:\Users\tima0\Documents\gamsdir\projdir\par.inc
/;





*******************************************************

$ontext
В данной части программы происходит подготовка и расчет данных для калибровочной модели
$offtext


        Coeff(cattle)                   = 1000 * Amount(cattle) / sum(beef, Amount(beef));
        Consumption(cattle)             = Coeff(cattle) * CattleNorm(cattle);
        Par('ras_potr')                       = Consumption('beef_cattle')+Consumption('sheep_goat')+Consumption('pig')+Consumption('poultry');

        Calibration_Feed_Unit(crops) = FeedUnitCoef(crops) * Fact_Area(crops) * productivity(crops) * FeedMassCoef(crops)*10000;


        Par('Feed_Cal')                       = sum(feed, FeedUnitCoef(feed) * Fact_Area(feed) * productivity(feed) * FeedMassCoef(feed) ) * 10000;

        Par('Roughage_Cal')                   = sum(roughage,FeedUnitCoef(roughage) * Fact_Area(roughage) * productivity(roughage) * FeedMassCoef(roughage) ) *10000;

        Par('FactAmFruits')               =       Fact_Area('orchards') * productivity('orchards') * reuse_factor('orchards') + Fact_Area('homestead') * productivity('orchards') * 0.3;
        Par('FactAmVeg')                  =       Fact_Area('vegetable') * productivity('vegetable') * reuse_factor('vegetable') + Fact_Area('homestead') * productivity('vegetable') * 0.7;
        Par('FactAmBread')                =       Fact_Area('rice') * productivity('rice') * reuse_factor('rice') + Fact_Area('wheat') * productivity('wheat') * reuse_factor('wheat');


        Par('SpecFactAmFr')               =        Par('FactAmFruits')*1000/Par('Population');
        Par('SpecFactAmVg')               =        Par('FactAmVeg')*1000/Par('Population');
        Par('SpecFactAmBrd')              =        Par('FactAmBread')*1000/Par('Population');




*******************************************************

$ontext
В данной части программы объявляем переменные и вернюю и нижнюю грани для переменных для калибровочной модели
$offtext

variable        PastureCoefCal   коэффициент использования пастбищ для корма скота
                PercentRoughage  коэффициент использования грубых кормов
                PercentFeed      коэффициент использования мягких кормов
                CoefCalibration Coefficientpotrebleniya dlya kormov ??? ;

                CoefCalibration.lo                =       0.5;
                CoefCalibration.up                =       10000;

                PercentFeed.lo      =       1;
                PercentFeed.up      =       99;

                PercentRoughage.lo      =       0.05;
                PercentRoughage.up      =       5;

                PastureCoefCal.lo       =       0.5;
                PastureCoefCal.up       =       10;



variable

        FeedUnitPastureCal   Количество кормовых единиц с учетом пастбищ
        PastureMilkCal       Количество молока полученного при кормлении скота на пастбищах
        PastureMeatCal       Количество мяса полученного при кормлении скота на пастбищах
        PercentRoughageMeat  процент грубых кормов идущих на производство мяса
        PercentFeedMeat      процент мягких кормов идущих на производство молока
        Milk_KgCal           Фактическое производство молока в КГ
        ProdMeatCal          Расчетное фактическое производство мяса
        ProdMilkCal          Расчетное Фактическое производство молока

        SpecProdMeatCal      Удельное фактическое производство мяса
        SpecProdMilkCal      Удельное фактическое производство молока

        DeviationCal         Отклонение калибровки от факта;

*******************************************************


$ontext
В данной части программы мы объявляем уравнения и структурируем калибровочную модель
$offtext

equation

        eq3_7            Расчет кормовых единиц с учетом пастбиц
        eq3_8            Расчет производства молока полученного с пастбищ
        eq3_9            Расчет производства мяса полученного с пастбищ

        eq3_13           Расчет процента грубых кормов затрачиваемых на производство мяса
        eq3_14           Расчет процента мягкиз кормов затрачиваемых на производство мяса
        eq3_18           Расчет производства молока в килограммах

        eq3_19           Расчет "фактического" производства мяса для калибровки модели
        eq3_20           Расчет "фактического" производства молока для калибровки модели
        eq3_1

        eq3_25           Расчет удельного производства мяса
        eq3_26           Расчет удельного производства молока


        Calibration;

        eq3_7..         FeedUnitPastureCal        =e=     sum(crops, Calibration_Feed_Unit(crops)) * PastureCoefCal;

        eq3_8..         PastureMilkCal            =e=     FeedUnitPastureCal*CoefCalibration/(CoefCalibration+1);

        eq3_9..         PastureMeatCal            =e=     FeedUnitPastureCal/(CoefCalibration+1);


        eq3_13..        PercentRoughageMeat       =e=     Par('Roughage_Cal') - Par('Roughage_Cal')*PercentRoughage/100;
        eq3_14..        PercentFeedMeat           =e=     Par('Feed_Cal') - PercentFeed*Par('Feed_Cal')/100 + PastureMeatCal;

        eq3_18..        Milk_KgCal                =e=     100*Par('MilkUnit')*((Par('Roughage_Cal')*PercentRoughage/100 + PercentFeed*Par('Feed_Cal')/100) + PastureMilkCal);
$ontext
        eq3_19..        ProdMeatCal               =e=     sum(beef, proizv_mk(beef))/1000;

        eq3_20..        ProdMilkCal               =e=     Milk_KgCal/1000000;
        eq3_1..         PercentFeed               =e=     100 - PercentRoughage;
        eq3_19..        ProdMeatCal              =e=     sum(beef, (Par('Roughage_Cal')-Par('Roughage_Cal')*PercentRoughage/100 + Par('Feed_Cal')-Par('Feed_Cal')*PercentFeed/100 + sum(crops,Calibration_Feed_Unit(crops)) * PastureCoefCal*(0.4*Amount('beef_cattle'))/(CoefCalibration*Amount('dairy_cattle')+Amount('beef_cattle')))*Consumption(beef)/Par('ras_potr')/Cattle_FeedUnit(beef)*0.1/1000);
$offtext


         eq3_19..        ProdMeatCal              =e=     sum(beef, (PercentRoughageMeat + PercentFeedMeat) * PastureCoefCal*(0.4*Amount('beef_cattle') + 0.6*Amount('sheep_goat'))/(CoefCalibration*Amount('dairy_cattle')+Amount('beef_cattle')+Amount('sheep_goat'))*Consumption(beef)/(Par('ras_potr'))/Cattle_FeedUnit(beef)*0.1/1000);

         eq3_20..        ProdMilkCal              =e=     100*Par('MilkUnit')*((Par('Roughage_Cal')*PercentRoughage + PercentFeed*Par('Feed_Cal'))/100 + sum(crops,Calibration_Feed_Unit(crops)) * PastureCoefCal * Amount('dairy_cattle')* CoefCalibration/Amount('dairy_cattle')*CoefCalibration+Amount('beef_cattle'))/1000000;



        eq3_25..        SpecProdMeatCal           =e=     ProdMeatCal*1000/Par('Population');

        eq3_26..        SpecProdMilkCal           =e=     ProdMilkCal*1000/Par('Population');

        eq3_1..         PercentRoughage           =e=     100 - PercentFeed;


        Calibration..     DeviationCal            =e=         sqr(ProdMeatCal - Par('FactProdMeat')) + sqr(ProdMilkCal - Par('FactProdMilk'));


        model Cal /eq3_1, eq3_7, eq3_8, eq3_9, eq3_13, eq3_14, eq3_18, eq3_19, eq3_20, eq3_25, eq3_26, Calibration/;
        solve Cal using dnlp minimizing DeviationCal;
*******************************************************


file calibrationCoefs /C:\xampp\mysql\data\gams\calibrationCoefs.csv/;

put calibrationCoefs;

put
'PastureCoefCal,'PastureCoefCal.l/
'CoefCalibration,'CoefCalibration.l/
'PercentRoughageCal,'PercentRoughage.l/
'PercentFeedCal,'PercentFeed.l/
putclose calibrationCoefs;


file outputFactData /C:\xampp\mysql\data\gams\outputFactData.csv/;



put outputFactData;
put
'ProdMeatCal,',ProdMeatCal.l/
'ProdMilkCal,',ProdMilkCal.l/
'SpecProdMeatCal,',SpecProdMeatCal.l/
'SpecProdMilkCal,',SpecProdMilkCal.l/
putclose outputFactData;
*******************************************************

$offlisting


$ontext
В данной части программы мы объявляем переменные и устанавливаем их верхнюю и нижнюю грани для первого этапа оптимизации состава культур
$offtext

positive variable       CropArea(crops) площадь посевов в тыс га;

                CropArea.lo('cotton')      =       80;
                CropArea.lo('forage')     =       1;
                CropArea.lo('maize')        =       1;
                CropArea.lo('orchards')      =       40;
                CropArea.lo('vegetable')   =       5;
                CropArea.lo('wheat')   =       35;
                CropArea.lo('rice')        =       0.2;

                CropArea.up('cotton')      =       280;
                CropArea.up('forage')     =       140;
                CropArea.up('maize')        =       100;
                CropArea.up('orchards')      =       170;
                CropArea.up('vegetable')   =       20;
                CropArea.up('wheat')   =       160;
                CropArea.up('rice')        =       3;

variable



        DeviationFromStdt        минимальное отклонение удельного производства продуктов питания от норм
        DeviationAddedTax        максимизация добавленной стоимости

        FeedUnitPasture          количество кормовых единиц с учетом пастбищ
        PastureMilk              Количество молока полученного при кормлении скота на пастбищах
        PastureMeat              Количество мяса полученного при кормлении скота на пастбищах
        PercentRoughageMeat      процент грубых кормов идущих на производство мяса
        PercentFeedMeat          процент мягких кормов идущих на производство молока
        Milk_Kg                  Фактическое производство молока в КГ
        PercentRoughageMilk      Процент грубых кормов в производстве молока
        PercentFeedMilk          Процент мягких кормов в производстве молока
        TotalFeedUnitMilk        Всего кормовых единиц для производства молока
        FeedUnitByCattle(cattle) Кормовых единиц скота
        ProdMeatByCattle(cattle) Производство мяса по каждому виду скота
        TotalYield(crops)        Валовый сбор культур
        FeedMass(crops)          Всего кормовой массы
        FeedUnit(crops)          Всего кормовых единиц

        WaterRateByCrop(crops)   Водопотребление

        TotalRoughage            Всего грубых кормов
        TotalFeed                Всего мягких кормов
        ProdFruits               Производство садовых
        ProdVeg                  Производство овощных
        ProdBread                Производство зерновых
        ProdMeat                 Производство мяса
        ProdMilk                 Производство молока

        SpecProdFruit            Удельное производство садовых
        SpecProdVeg              Удельное производство овощных
        SpecProdBread            Удельное производство зерновых
        SpecProdMeat             Удельное производство мяса
        SpecProdMilk             Удельное производство молока

        TotalArea;

*******************************************************

$ontext
В данной части программы мы объявляем уравнения и структурируем модель для первого этапа оптимизации состава культур
$offtext

equation

        eq1_1            Расчет общего количества кормовых единиц

        eq1_2(crops)     Расчет валового сбора
        eq_wat(crops)

        eq1_3(crops)     Расчет кормовой массы
        eq1_4(crops)     Расчет кормовых единиц

        eq1_5            Расчет общего количества грубых кормов
        eq1_6            Расчет общего количества мягких кормов
        eq1_7            Расчет кормовых единиц с учетом пастбищ
        eq1_8            Расчет производства молока полученного с пастбищ
        eq1_9            Расчет производства мяса полученного с пастбищ
        eq1_10           Расчет процента грубых кормов для производства молока
        eq1_11           Расчет процента мягких кормов используемых для производства молока
        eq1_12           Расчет общего количества кормовых единиц при производстве молока
        eq1_13           Расчет процента грубых кормов для производства мяса
        eq1_14           Расчет процента мягких кормов для производства мяса
        eq1_16(beef)     Расчет комовых единиц по каждому виду скота
        eq1_17(beef)     Расчет роизводства мяса по каждому виду скота
        eq1_18           Расчет производства молока в кг
        eq1_19           Расчет производства мяса
        eq1_20           Расчет производства молока
        eq1_21           Расчет производства садовых
        eq1_23           Расчет производства овощных
        eq1_24           Расчет производства зерновых
        eq1_25           Расчет удельного производства мяса
        eq1_26           Расчет удельного производства молока
        eq1_27           Расчет удельного производства садовых
        eq1_29           Расчет удельного производства овощных
        eq1_30           Расчет удельного производства зерновых

$ontext
        eq1_31
        eq1_32
        eq1_33
        ComputeArea
$offtext

        ComputeWaterRate Расчет ограничения по водным ресурсам

        eq1_34

        OptFoodSecure целевая функция - минимизация квадрата отклонения нормы потребления от удельного произвосдва продуктов питания;

$onlisting


        eq1_2(crops)..      TotalYield(crops)              =e=     Inn_Area(crops) * CropArea(crops) * reuse_factor(crops)  * Inn_Productivity(crops) * productivity(crops) * 1000 + (1 - Inn_Area(crops)) * CropArea(crops) * reuse_factor(crops) * productivity(crops) * 1000;
        eq_wat(crops)..     WaterRateByCrop(crops)         =e=     Inn_Area(crops) * CropArea(crops) * reuse_factor(crops)  * Inn_WaterRate(crops) * WaterRate(crops) * 1000 + (1 - Inn_Area(crops)) * CropArea(crops) * reuse_factor(crops) * WaterRate(crops)* 1000;

        eq1_3(crops)..      FeedMass(crops)                =e=     TotalYield(crops) * FeedMassCoef(crops);
        eq1_4(crops)..      FeedUnit(crops)                =e=     FeedUnitCoef(crops) * FeedMass(crops)*10000;
$ontext
        ComputeArea..         Par('Area')                  =g=     sum(crops, CropArea(crops)) - CropArea('grain') - CropArea('silage');

        eq1_31..         CropArea('maize')                  =e=     CropArea('silage');
        eq1_32..         CropArea('maize')                  =e=     CropArea('grain');
        eq1_33..         TotalArea                         =e=     sum(crops, CropArea(crops)) - CropArea('grain') - CropArea('silage');
$offtext
        eq1_5..         TotalRoughage                      =e=     sum(roughage,FeedUnit(roughage));

        eq1_6..         TotalFeed                          =e=     sum(feed, FeedUnit(feed));

        eq1_7..         FeedUnitPasture                    =e=     sum(crops, FeedUnit(crops)) * PastureCoefCal;

        eq1_8..         PastureMilk                        =e=     FeedUnitPasture*CoefCalibration/(CoefCalibration+1);

        eq1_9..         PastureMeat                        =e=     FeedUnitPasture/(CoefCalibration+1);

        eq1_10..        PercentRoughageMilk                =e=     TotalRoughage*PercentRoughage/100;

        eq1_11..        PercentFeedMilk                    =e=     PercentFeed*TotalFeed/100;

        eq1_12..        TotalFeedUnitMilk                  =e=     PercentRoughageMilk + PercentFeedMilk;

        eq1_13..        PercentRoughageMeat                =e=     TotalRoughage - TotalRoughage*PercentRoughage/100;

        eq1_14..        PercentFeedMeat                    =e=     TotalFeed - PercentFeed*TotalFeed/100 + PastureMeat;

        eq1_16(beef)..  FeedUnitByCattle(beef)             =e=     (PercentRoughageMeat + PercentFeedMeat)*Consumption(beef)/Par('ras_potr');

        eq1_17(beef)..  ProdMeatByCattle(beef)             =e=     FeedUnitByCattle(beef)/Cattle_FeedUnit(beef)*0.1;

        eq1_18..        Milk_Kg                            =e=     100*Par('MilkUnit')*((TotalRoughage*PercentRoughage/100 + PercentFeed*TotalFeed/100) + PastureMilk);

        eq1_19..        ProdMeat                           =e=     sum(beef, ProdMeatByCattle(beef))/1000;

        eq1_20..        ProdMilk                           =e=     Milk_Kg/1000000;

        eq1_21..        ProdFruits                         =e=     CropArea('orchards') * productivity('orchards') * reuse_factor('orchards') + Fact_Area('homestead') * productivity('orchards') * 0.3;

        eq1_23..        ProdVeg                            =e=     CropArea('vegetable') * productivity('vegetable')  * reuse_factor('vegetable') + Fact_Area('homestead') * productivity('vegetable') * 0.7;

        eq1_24..        ProdBread                          =e=     CropArea('wheat') * productivity('wheat')  * reuse_factor('wheat') + CropArea('rice') * productivity('rice')  * reuse_factor('rice');

        eq1_25..        SpecProdMeat                       =e=     ProdMeat*1000/Par('Population');

        eq1_26..        SpecProdMilk                       =e=     ProdMilk*1000/Par('Population');

        eq1_27..        SpecProdFruit                      =e=     ProdFruits*1000/Par('Population');

        eq1_29..        SpecProdVeg                        =e=     ProdVeg*1000/Par('Population');

        eq1_30..        SpecProdBread                      =e=     ProdBread*1000/Par('Population');

        eq1_34..        SpecProdMilk                       =l=     Par('std_Milk') * Par('pc_mol');

        ComputeWaterRate..        Par('Amount_Water')      =g=     sum(crops, WaterRateByCrop(crops));

        OptFoodSecure..     DeviationFromStdt              =e=     sqr(SpecProdMeat-Par('std_Meat') * Par('pc_meat')) + sqr(SpecProdMilk - Par('std_Milk') * Par('pc_mol'))  + sqr(SpecProdFruit - Par('std_Fruit') * Par('pc_fr')) + sqr(SpecProdVeg - Par('std_Veg') * Par('pc_veg')) + sqr(SpecProdBread - Par('std_Bread') * Par('pc_hl'));



        model FoodSecure /eq1_34, eq1_2, eq1_3, eq1_4, eq1_5, eq1_6, eq1_7, eq1_8, eq1_9, eq1_10, eq1_11, eq1_12, eq1_13, eq1_14, eq1_16, eq1_17, eq1_18, eq1_19, eq1_20, eq1_21, eq1_23, eq1_24, eq1_25, eq1_26, eq1_27, eq1_29, eq1_30, eq_wat, ComputeWaterRate, OptFoodSecure/;
        solve FoodSecure using dnlp minimizing DeviationFromStdt;

        OutputTable(crops, 'AreaOutputModel1')           =       CropArea.l(crops);


*******************************************************

file outputCompData /C:\xampp\mysql\data\gams\outputCompData.csv/;

put outputCompData;
put     'ProdMeat,', ProdMeat.l/
        'ProdMilk,', ProdMilk.l/
        'ProdFruits,', ProdFruits.l/
        'ProdBread,', ProdBread.l/
        'ProdVeg,', ProdVeg.l/
        'SpecProdMeat,', SpecProdMeat.l/
        'SpecProdMilk,', SpecProdMilk.l/
        'SpecProdFruit,', SpecProdFruit.l/
        'SpecProdBread,', SpecProdBread.l/
        'SpecProdVeg,', SpecProdVeg.l/;

        loop(Set_Parameters, put Set_Parameters.tl',', par(Set_Parameters)/);
$ontext
        loop((CropsChar, crops), put CropsChar.tl',', d(crops, CropsChar)','/);
$offtext
*******************************************************

$ontext
В данной части программы мы объявляем переменные, уравнения и структурируем модель для второго этапа оптимизации состава культур
$offtext

variable        IncomeByCrop(crops)
                ExpensesByCrop(crops)
                WageByCrop(crops)
                ProfitByCrop(crops)
                TaxByCrop(crops)
                AddedTaxByCrop(crops);



equation
        eq2_1(crops) Расчет дохода с каждой культуры
        eq2_2(crops) Расчет затрат на каждую культуру
        eq2_3(crops) Расчет прибыль с каждой культуры
        eq2_4(crops) Расчет з\п по культурам
        eq2_5(crops) Расчет налогов с культуры
        eq2_6(crops) Расчет добавленной стоимости за культуру
        eq2_9(crops) Ограничение по площади ЗП
        OptAddedTax  Максимизация добавленной стоимости;


        eq2_1(crops)..      IncomeByCrop(crops)   =e=     CropArea(crops) * productivity(crops) * Cost(crops) * reuse_factor(crops);
        eq2_2(crops)..      ExpensesByCrop(crops) =e=     CropArea(crops) * Coef_Expenses(crops) * reuse_factor(crops);
        eq2_3(crops)..      ProfitByCrop(crops)   =e=     IncomeByCrop(crops) - ExpensesByCrop(crops);
        eq2_4(crops)..      WageByCrop(crops)     =e=     CropArea(crops) * Wages(crops) * reuse_factor(crops)/100;
        eq2_5(crops)..      TaxByCrop(crops)      =e=     CropArea(crops) * Tax(crops) * reuse_factor(crops)/100;
        eq2_6(crops)..      AddedTaxByCrop(crops) =e= ProfitByCrop(crops) * Conversion(crops) + WageByCrop(crops) + TaxByCrop(crops) + ProfitByCrop(crops);


        eq2_9(crops)..      OutputTable(crops, 'AreaOutputModel1')           =l=     CropArea(crops);



        OptAddedTax..       DeviationAddedTax     =e=     sum(crops, AddedTaxByCrop(crops));

        model MaxAddedTax /eq1_34, eq2_1, eq2_2, eq2_3, eq2_4, eq2_5, eq2_6, eq2_9, eq_wat, ComputeWaterRate, OptAddedTax, eq1_2, eq1_3, eq1_4, eq1_5, eq1_6, eq1_7, eq1_8, eq1_9, eq1_10, eq1_11, eq1_12, eq1_13, eq1_14, eq1_16, eq1_17, eq1_18, eq1_19, eq1_20, eq1_21, eq1_23, eq1_24, eq1_25, eq1_26, eq1_27, eq1_29, eq1_30/;
        solve MaxAddedTax using dnlp maximizing DeviationAddedTax;


        OutputTable(crops, 'IncomeOutput')          =       IncomeByCrop.l(crops);
        OutputTable(crops, 'ExpensesOutput')        =       ExpensesByCrop.l(crops);
        OutputTable(crops, 'ProfitOutput')          =       ProfitByCrop.l(crops);
        OutputTable(crops, 'WagesOutput')           =       WageByCrop.l(crops);
        OutputTable(crops, 'TaxOutput')             =       TaxByCrop.l(crops);
        OutputTable(crops, 'AddedTaxOutput')        =       AddedTaxByCrop.l(crops);
        OutputTable(crops, 'AreaOutputModel2')      =       CropArea.l(crops);
        OutputTable(crops, 'TotalYieldOutput')      =       TotalYield.l(crops);
        OutputTable(crops, 'FeedMassOutput')        =       FeedMass.l(crops);
        OutputTable(crops, 'FeedUnitOutput')        =       FeedUnit.l(crops);
        OutputTable(crops, 'TotalYieldWoInn')       =       CropArea.l(crops) * productivity(crops);
        OutputTable(crops, 'In_Productivity ')      =       TotalYield.l(crops) / CropArea.l(crops);
        OutputTable(crops, 'In_WaterRate')          =       CropArea.l(crops) * WaterRate(crops);

*******************************************************

put     'DeviationAddedTax,', DeviationAddedTax.l/
        '"SpecProdMeat 2nd",', SpecProdMeat.l/
        '"SpecProdMilk 2nd",', SpecProdMilk.l/
        '"SpecProdFruit 2nd",', SpecProdFruit.l/
        '"SpecProdBread 2nd",', SpecProdBread.l/
        '"SpecProdPotato 2nd",', SpecProdVeg.l/
        'PastureCoefCal,', PastureCoefCal.l/
        'CoefCalibration,', CoefCalibration.l/
        'PercentFeed,', PercentFeed.l/
        'PercentRoughage,', PercentRoughage.l/;

putclose outputCompData;
*******************************************************
$ontext
variable

        MinDeviationKkalModel
        StandartKkal;

equation

        OptKkalModel
        eq4_1;

        Par('k_n_god')                                    =        Par('k_norm') * Par('Population') * 365.6 / 100000;

        eq4_1..         StandartKkal                      =e=     ( ProdMeat * Par('k_meat') + ProdMilk * Par('k_milk') + SpecProdFruit * Par('k_fr') + ProdMelon * Par('k_bh') + ProdPotato * Par('k_krt') + ProdBread * Par('k_hl') ) / 100000 * Par('Population');
        OptKkalModel..     MinDeviationKkalModel          =e=     sqr(StandartKkal - Par('k_n_god'));

        model kalorii /eq4_1, OptKkalModel, ComputeArea, eq_wat, ComputeWaterRate, eq1_2, eq1_3, eq1_4, eq1_5, eq1_6, eq1_7, eq1_8, eq1_9, eq1_10, eq1_11, eq1_12, eq1_13, eq1_14, eq1_16, eq1_17, eq1_18, eq1_19, eq1_20, eq1_21, eq1_22, eq1_23, eq1_24, eq1_25, eq1_26, eq1_27, eq1_28, eq1_29, eq1_30/;
        solve kalorii using dnlp minimizing MinDeviationKkalModel;

        OutputTable(crops, 'AreaOutputModel3')            =       CropArea.l(crops);

*******************************************************

put     'otkl ot normi kaloriy;', MinDeviationKkalModel.l/
        'proizvedeno myasa kalorii;', SpecProdMeat.l/
        'proizvedeno moloka kalorii;', SpecProdMilk.l/
        'proizvedeno ovoshey crops bahchi kalorii;', SpecProdMelon.l/
        'proizvedeno fruktov kalorii;', SpecProdFruit.l/
        'proizvedeno hleba kalorii;', SpecProdBread.l/
        'proizvedeno kartoshki kalorii;', SpecProdPotato.l/
         loop((OutputData, crops), put OutputData.tl';', OutputTable(crops, OutputData)';'/);
         loop(crops, put crops.tl';', WaterRateByCrop.l(crops)';'/)
$offtext


