//

//
// In the separate window of same Symbol run Indicator 'SIMULATOR_DRAW_BLACKBOX.mq4'.
// It will draw BlackBox, which will close the right side of the chart, so you will not see
// future prices and volumes.
//
//



#property strict


extern string   EA_VERSION                    = "2024.12.17.   <===>   v1.5.002";
//extern string   DATABASE_DATE                 = "2012.05.31.";






extern string   _2                              = "";
extern double   Profit_Threshold_Pips           = 100.0;
extern double   Lots_Init                       = 0.01;
extern double   Lots_Increased                  = 0.50;
extern double   TP_Increased                    = 100.0;
extern string   __                              = "";



extern string   ___                           = "";
extern bool     SM_1_Mode_TP_INIT_Mult_SL     = false;
extern double   SM_1_TP_INIT_Multiplier       = 10.0;
extern double   SM_1__TP_Fixed                = 400.0;
extern string   ____                          = "--------------------------------------------------------";
extern string   SM_2_Mode_SL_Opt__ATR_0__FX_1 = "Mode_SL_ATR=0    Mode_SL_Fixed=1";
extern int      SM_2__Mode_SL                 = 0;
extern string   _____                         = "--------------------------------------------------------";
extern int      SM_2___SL__ADR_Period         = 20;
extern double   SM_2___SL__ADR_Multiplier     = 0.3;
extern string   ______                        = "--------------------------------------------------------";
extern double   SM_2__SL_Fixed                = 40.0;
extern string   _______                       = "--------------------------------------------------------";
extern bool     SM_3_Mode_BE                  = false;
extern bool     SM_3_Mode_BE_Equal_SL         = false;
extern double   SM_3__BE_Fixed                = 30.0;
extern double   SM_3__BE__Delta_Pips          = 5.0;
extern string   ________                      = "--------------------------------------------------------";
extern bool     SM_4_Mode_TS                  = false;
extern bool     SM_4_Mode_TS_On_BE_Only       = false;
extern bool     SM_4_Mode_TS_On_BE_Only_Once  = true;
extern bool     SM_4_Mode_TS_Show_SL          = true;
extern double   SM_4_TS_Fixed                 = 45.0;
extern double   SM_4_TS_Step                  = 30.0;
extern string   _________                     = "--------------------------------------------------------";
extern bool     SM_5_Mode_TimeBased_OC        = false;                         // We close REAL Order with Profit less than 'SM_5__Profit_TB_OC_PIPS' after 'SM_5__Max_Bars_TimeBased_OC' Bars.
extern int      SM_5__Max_Bars_TimeBased_OC   = 7;
extern double   SM_5__Profit_TB_OC_PIPS       = -25.0;
extern string   __________                    = "--------------------------------------------------------";
extern bool     SM_6_Mode_MM                  = false;
extern double   SM_6__MM_Risk_Percent         = 2.0;
extern double   SM_6__Order_Lots              = 0.01;
extern string   ___________                   = "";
extern bool     SM_7_Mode_Trading_Session     = false;
extern bool     SM_7_Show_Sess_Borders        = true;
extern bool     SM_7__Sess_RECT_or_VLINE      = true;
extern string   Trading_Session_Start         = "5:00";
extern string   Trading_Session_End           = "15:00";
extern color    Color_Trading_Session         = Gainsboro;
extern string   ____________                  = "--------------------------------------------------------";
extern double   SM_8_Hard_Limit_StopLevel     = 1.0;                           // PIPS with 2 or 4 digits (even if 3 or 5 used in chart)
extern double   SM_8_Hard_Limit_MIN_SL        = 40.0;                          // PIPS with 2 or 4 digits (even if 3 or 5 used in chart)
extern double   Hard_Limit_MAX_Lots           = 20.0;
extern double   Hard_Limit_MIN_Lots           = 0.01;
extern string   _____________                 = "--------------------------------------------------------";
extern bool     SM_9_Mode_Show_Info_On_Screen = false;
extern bool     SM_9_Mode_Show_ADR_Borders    = false;
extern double   SM_9_Period_ADR               = 14;
extern string   ______________                = "--------------------------------------------------------";
extern bool     SM__10_Make_TESTER_Template   = true;                          // Will Draw Rectangles in the Visualization Window (don't remember why I needed them <<<=== probably I have another EA which can run optimization based on trades, marked by these rectangles)
extern color    Color_Buy                     = LightGreen;
extern color    Color_Sell                    = LightPink;
extern string   _______________               = "--------------------------------------------------------";
extern bool     Mode_Show_THRESH_B_S_Marks    = true;
extern double   Threshold_Buy                 = 6.0;
extern double   Threshold_Sell                = 3.0;
extern string   ________________              = "--------------------------------------------------------";
extern string   _________________             = "--------------------------------------------------------";
extern bool     Mode_TEST                     = true;                          // Print STATISTICS in Comments part of Visualization Window!
extern bool     Mode_TEST_DEINIT_Only         = false;                         // Used in TESTING MODE ONLY!
//extern double   Delta_BE_Pips                 = 5.0;
extern string   __________________            = "";
extern bool     Mode_TEST___Mark_Profits      = false;                         // Used in TESTING MODE ONLY!
extern bool     Mode_TEST___Mark_Losses       = false;                         // Used in TESTING MODE ONLY!
extern string   ___________________           = "";
extern color    Color_Profit_Buy              = DarkOrange;
extern color    Color_Profit_Sell             = DarkOrange;
extern color    Color_Losing_Buy              = Black;
extern color    Color_Losing_Sell             = Black;
extern string   ____________________          = "--------------------------------------------------------";
extern string   _____________________         = "--------------------------------------------------------";
extern color    Color_Only_Buy                = Lime;
extern color    Color_Only_Sell               = Red;
extern string   ______________________        = "--------------------------------------------------------";
extern color    Color_Text_Active             = Black;
extern color    Color_Text_Passive            = SteelBlue;








int             SM_0______________________    = 0;
int             SM_1______________________    = 0;
int             SM_2______________________    = 0;
int             SM_3______________________    = 0;
int             SM_4______________________    = 0;
int             SM_5______________________    = 0;
int             SM_6______________________    = 0;
int             SM_7______________________    = 0;
int             SM_8______________________    = 0;
int             SM_9______________________    = 0;
int             SM__10____________________    = 0;








int             My_Magic_Number               = 123456;
int             Slippage                      = 2;



datetime        Current_Time                  = 0;
datetime        Time_Trading_Session_Start    = 0;
datetime        Time_Trading_Session_End      = 0;

datetime        Time_Handle                   = 0;
datetime        Time_Handle_THRESH            = 0;

datetime        Time_Last_Bar_M5              = 0;
datetime        Time_Last_Bar_M15             = 0;
datetime        Time_Last_Bar_M30             = 0;
datetime        Time_Last_Bar_H1              = 0;
datetime        Time_Last_Bar_H4              = 0;
datetime        Time_Last_Bar_D1              = 0;
datetime        Time_Last_Bar_W1              = 0;

datetime        Time_Prev_Bar_M5              = 0;
datetime        Time_Prev_Bar_M15             = 0;
datetime        Time_Prev_Bar_M30             = 0;
datetime        Time_Prev_Bar_H1              = 0;
datetime        Time_Prev_Bar_H4              = 0;
datetime        Time_Prev_Bar_D1              = 0;
datetime        Time_Prev_Bar_W1              = 0;


double          TP_REAL                       = 0.0;
double          SL_REAL                       = 0.0;

double          ORDER_OPEN_PRICE              = 0.0;
double          StopLevel                     = 1000.0;
double          MoneyAvailable                = 0.0;
double          SM_6__Order_Lots_Real         = 0.0;
double          TLINE_Value_Buy               = 0.0;
double          TLINE_Value_Sell              = 0.0;
double          PointX                        = 10000.0;
double          LotVal                        = 10000.0;                       //стоимость 1 пункта 1 лота

string          MyLine_Set_Stop_Buy           = "MyLine_Set_Stop_Buy";
string          MyLine_Set_Stop_Sell          = "MyLine_Set_Stop_Sell";
string          MyLine_Set_Limit_Buy          = "MyLine_Set_Limit_Buy";
string          MyLine_Set_Limit_Sell         = "MyLine_Set_Limit_Sell";
string          MyLine_Set_SL                 = "MyLine_Set_SL";


string          MyLine_HLINE_TP               = "MyLine_HLINE_TP__";
string          MyLine_HLINE_SL               = "MyLine_HLINE_SL__";
string          MyLine_HLINE_OP               = "MyLine_HLINE_xOP_";

string          Mode_Order_Confirm            = "";  // Mode_Order_Confirm        = "OFF";


string          Text_Font                     = "Lucida Console";
int             Text_Font_Size                = 10;                           // Was 14
color           Text_Color                    = Blue;

bool            status_Warning_TS_0           = false;
bool            status_Warning_TS_Small       = false;
bool            status_Warning_TS_Multiplier  = false;

double          ATR_Value_0                   = 0.0;

//double          Max_Total_Profit_PIPS         = 0.0;
double          Account_Balance_INIT          = 0.0;

//int             counter_Max_Trades_Profitable = 0;
//int             counter_Max_Trades_Losing     = 0;
//int             Max_Trades_Profitable         = 0;
//int             Max_Trades_Losing             = 0;
//int             Max_Trades_BE                 = 0;

int             Orders_History_Total          = 0;
int             Orders_HIST_Total___HLINES    = 0;

int             i                             = 0;
int             TM_Counter                    = 0;

int             SL_ATR_Show                   = 0;


double          Order_Lots                    = 0.01;


bool   STATUS_TMP  = false;

double INT_1_TMP   = 99999;
double INT_2_TMP   = 99999;
double INT_3_TMP   = 99999;

bool            Status_Pattern_Created_Buy    = false;
bool            Status_Pattern_Created_Sell   = false;



double          MaxEquity                       = 0.0;
double          DrawDownAbs                     = 0.0;
double          DrawDownRel                     = 1.0;
double          Relative_Drawdown               = 0.0;
double          Relative_Drawdown_Report        = 0.0;

double          Local_DD_Z_Prev                 = 0.0;
double          Local_DD_Z                      = 0.0;

double          Local_DD_X                      = 0.0;
double          Local_DD_X_Prev                 = 0.0;
double          Local_DD_REPORT                 = 0.0;
string          Local_DD_REPORT_Time            = "";




bool            Status_Equity                   = false;

double          Balance_Max                     = 0.0;
double          Equity_MAX                      = 0.0;
double          Equity_MAX_Draw                 = 0.0;
double          Equity_MAX_X                    = 0.0;
double          Equity_MIN_Z                    = 0.0;

double          Balance_Current                 = 0.0;
double          Equity_Current                  = 0.0;
double          Balance_Last                    = 0.0;

double          Equity_At_Balance               = 0.0;


datetime        Handle_Time                     = 0;

bool            _IsOptimization                 = false;









double Max_Total_Profit_PIPS                   = 0.0;
double Aver_Profit_In_Profitable               = 0.0;
double Aver_Loss_In_Losing                     = 0.0;
int    counter_Max_Trades_BE                   = 0;
int    counter_Max_Trades_Profitable           = 0;
int    counter_Max_Trades_Losing               = 0;
int    counter_Total_Trades                    = 0;
int    counter_Total_Trades_BE                 = 0;
int    counter_Total_Trades_Profitable         = 0;
int    counter_Total_Trades_Losing             = 0;
int    Max_Trades_BE                           = 0;
int    Max_Trades_Profitable                   = 0;
int    Max_Trades_Losing                       = 0;
double Percent_BreakEven                       = 0.0;
double Percent_Profitable                      = 0.0;
double Percent_Losing                          = 0.0;














datetime        Array_TM_OrderTimeClose[];
int             Array_TM_OrderTicket[];

double          Array_Open_Orders_Buy[][5];  // [][Ticket, SL, TP, Lots]
double          Array_Open_Orders_Sel[][5];  // [][Ticket, SL, TP, Lots]


// Array_CLSD_TimeOpen[][9]
// TimeOpen      OrderOpenTime
// PriceOpen     OrderOpenPrice
// TimeClose     OrderCloseTime
// PriceClose    OrderClosePrice
// OrderType     OrderType
// SL            OrderStopLoss
// TP            OrderTakeProfit
// Lots          OrderLots
// OrderProfit   OrderProfit
double          Array_CLSD_TimeOpen[][9];    // [][TimeOpen, PriceOpen, TimeClose, PriceClose, OrderType, SL, TP, Lots, OrderProfit]















// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
void init() {
   _IsOptimization               = IsOptimization();
   Order_Lots                    = Lots_Init;
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
   Account_Balance_INIT          = AccountBalance();
   StopLevel                     = MarketInfo(Symbol(),MODE_STOPLEVEL);
   LotVal                        = MarketInfo(Symbol(),MODE_TICKVALUE);            //стоимость 1 пункта 1 лота
   if(Digits==5 || Digits==3) {
      PointX                     = Point     * 10;
      Slippage                   = Slippage  * 10;
      StopLevel                  = StopLevel / 10;
      LotVal                     = LotVal    * 10;
   }
   if(Digits==4 || Digits==2) {
      PointX                     = Point;
   }
   if(StopLevel<=0.0) {
      StopLevel                  = 1.0;
   }
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if(MarketInfo(Symbol(),MODE_MAXLOT)<Hard_Limit_MAX_Lots) {
      Hard_Limit_MAX_Lots        = MarketInfo(Symbol(),MODE_MAXLOT);
   }
   if(MarketInfo(Symbol(),MODE_MINLOT)>Hard_Limit_MIN_Lots) {
      Hard_Limit_MIN_Lots        = MarketInfo(Symbol(),MODE_MINLOT);
   }
   if(SM_8_Hard_Limit_StopLevel<StopLevel) {
      SM_8_Hard_Limit_StopLevel  = StopLevel;
   }
//   if(SM_8_Hard_Limit_MIN_SL<2*StopLevel) {
//      SM_8_Hard_Limit_MIN_SL     = 100.0;
//   }
   if(PointX>0.0) {
      Print("====================================================================================");
      Print("   <>   ", Symbol(), "   <>   EA_VERSION          = ", EA_VERSION );
//      Print("   <>   ", Symbol(), "   <>   DATABASE_DATE       = ", DATABASE_DATE );
      Print("------------------------------------------------------------------------------------");
      Print("   <>   ", Symbol(), "   <>   SWAPLONG            = ", MarketInfo(Symbol(),MODE_SWAPLONG) );
      Print("   <>   ", Symbol(), "   <>   SWAPSHORT           = ", MarketInfo(Symbol(),MODE_SWAPSHORT) );
      Print("   <>   ", Symbol(), "   <>   MODE_MARGINREQUIRED = ", MarketInfo(Symbol(),MODE_MARGINREQUIRED) );
      Print("   <>   ", Symbol(), "   <>   MODE_LOTSIZE        = ", MarketInfo(Symbol(),MODE_LOTSIZE) );
      Print("   <>   ", Symbol(), "   <>   MODE_LOTSIZE MINE   = ", MarketInfo(Symbol(),MODE_LOTSIZE) * MathMax(Hard_Limit_MIN_Lots,MarketInfo(Symbol(),MODE_MINLOT)) );
      Print("   <>   ", Symbol(), "   <>   MODE_LOTSTEP        = ", MarketInfo(Symbol(),MODE_LOTSTEP) );
      Print("   <>   ", Symbol(), "   <>   MODE_MINLOT         = ", MarketInfo(Symbol(),MODE_MINLOT) );
      Print("   <>   ", Symbol(), "   <>   Hard_Limit_MIN_Lots = ", Hard_Limit_MIN_Lots );
      Print("   <>   ", Symbol(), "   <>   MODE_MAXLOT         = ", MarketInfo(Symbol(),MODE_MAXLOT) );
      Print("   <>   ", Symbol(), "   <>   MODE_STOPLEVEL      = ", StopLevel );
      Print("   <>   ", Symbol(), "   <>   MODE_FREEZELEVEL    = ", MarketInfo(Symbol(),MODE_FREEZELEVEL) );
      Print("   <>   ", Symbol(), "   <>   ACCOUNT_LEVERAGE    = ", AccountLeverage() );
      Print("   <>   ", Symbol(), "   <>   SPREAD NOW          = ", NormalizeDouble(((Ask-Bid)/PointX),1) );
      Print("====================================================================================");
   }
// RESET TERMINAL VARIABLES IF THEY ARE ALREADY EXIST IN MT4
   datetime LTF_Time_0                        = Time[0];      // LTF == LOWER TF == M1 or M5
//   double   MTF_Open_0                        = Open[0];
//   GlobalVariableSet("_GV_SIMAN_BB_SWITCH_1440",   1);
//   GlobalVariableSet("_GV_SIMAN_BB_SWITCH_240",    1);
//   GlobalVariableSet("_GV_SIMAN_BB_SWITCH_60",     1);
//   GlobalVariableSet("_GV_SIMAN_BB_SWITCH_15",     1);
//
//   GlobalVariableSet("_GV_SIMAN_BB_SWITCH_V_1440",   1);
//   GlobalVariableSet("_GV_SIMAN_BB_SWITCH_V_240",    1);
//   GlobalVariableSet("_GV_SIMAN_BB_SWITCH_V_60",     1);
//   GlobalVariableSet("_GV_SIMAN_BB_SWITCH_V_15",     1);
   GlobalVariableSet("_GV_SIMAN_BB_Time_0", LTF_Time_0);
//   GlobalVariableSet("_GV_SIMAN_BB_Open_0", MTF_Open_0);
// EO RESET TERMINAL VARIABLES IF THEY ARE ALREADY EXIST IN MT4
   GlobalVariableSet("_GV_SIMAN_Time_1_W1",  LTF_Time_0);
   GlobalVariableSet("_GV_SIMAN_Time_1_D1",  LTF_Time_0);
   GlobalVariableSet("_GV_SIMAN_Time_1_H4",  LTF_Time_0);
   GlobalVariableSet("_GV_SIMAN_Time_1_H1",  LTF_Time_0);
   GlobalVariableSet("_GV_SIMAN_Time_1_M30", LTF_Time_0);
   GlobalVariableSet("_GV_SIMAN_Time_1_M15", LTF_Time_0);
   GlobalVariableSet("_GV_SIMAN_Time_1_M5",  LTF_Time_0);
   GlobalVariableSet("_GV_SIMAN_CREATE_ARR_IMMEDIATELY", 0);  // If '1' => run creation of array
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
} // void init() {
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++












// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
int deinit() {
   FUNCTION_TEST_MODE(false, true, true);       // FUNCTION_TEST_MODE(bool Mode_TEST_Comments, bool Mode_TEST_TABLE, bool Mode_Deinit)
   FUNCTION_CREATE_ARRAY_REAL();
   FUNCTION_SAVE_ARRAY2FILE(Array_CLSD_TimeOpen);
   return(0);
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
} // deinit() {
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++













// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
int start() {
//   FUNC_DEL_TLINES_WEEKENDS();
   FUNCTION_TERMINAL_VARIABLES();
   FUNCTION_DRAW_CHANGE_LABEL();            // MUST BE AT THE BEGINNING OF START() - Used for manual confirmation Orders opening
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if(SM_1__TP_Fixed<StopLevel) {
      Alert(Symbol()+": SM_1__TP_Fixed ", SM_1__TP_Fixed, " is less than ", StopLevel, " -> You MUST increase it!");
      return(0);
   }
   if(SM_3__BE_Fixed<15.0) {
      Alert(Symbol()+": SM_3__BE_Fixed ", SM_3__BE_Fixed, " is less than 15 PIPS -> You MUST increase it!");
      return(0);
   }
//   if(SM_2__SL_Fixed<SM_8_Hard_Limit_MIN_SL) {
//      Alert(Symbol()+": SM_2__SL_Fixed ", SM_2__SL_Fixed, " is less than ", SM_8_Hard_Limit_MIN_SL, " -> [SM_8_Hard_Limit_MIN_SL] Will be used!");
//      SM_2__SL_Fixed = SM_8_Hard_Limit_MIN_SL;
//   }
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if(SM_4_Mode_TS==true   &&   SM_4_TS_Fixed<=15.0) {
      if(status_Warning_TS_0==false) {
         Alert("\n\n ", Symbol()+": --------- Error: [SM_4_Mode_TS=true] , But [SM_4_TS_Fixed<=15] ===>>> Automatically Set [SM_4_Mode_TS=false]!!!");
         status_Warning_TS_0             = true;
      }
      SM_4_Mode_TS                       = false;
   }
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if(SM_4_Mode_TS==true   &&   (SM_4_TS_Fixed<StopLevel   ||   (SM_4_TS_Fixed+SM_4_TS_Step)<StopLevel*2) ) {
      if(status_Warning_TS_Small==false) {
         Alert("\n\n ", Symbol()+": --------- Error ->  SM_4_TS_Fixed = ", SM_4_TS_Fixed, " is TOO SMALL! -> You MUST increase it!");
         status_Warning_TS_Small         = true;
      }
      return(0);
   }
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if(SM_4_Mode_TS==true   &&   SM_4_TS_Step<1) {
      if(status_Warning_TS_Multiplier==false) {
         Alert("\n\n ", Symbol()+": --------- Error: SM_4_TS_Step  Must be equal or bigger than 1 !!! EA Stopped!");
         status_Warning_TS_Multiplier    = true;
      }
      return(0);
   }
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if(SM_4_Mode_TS_On_BE_Only==true   &&   SM_3_Mode_BE==false) {
      Alert("\n\n ", Symbol()+": --------- Error: If [SM_4_Mode_TS_On_BE_Only==true] => SM_3_Mode_BE Also Must Be TRUE too!!! EA Stopped!");
      return(0);
   }
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
// DEFINE TERMINAL VARIABLES - THEY WILL BE USED BY INDICATORS IN SEPARATE WINDOWS IN ORDER TO CLOSE BARS IN THE FUTURE
// ----------------------------------------------------------
// DEFINE PARAMETERS FOR THE LAST==CURRENT OPEN MTF CANDLE
// `````````````````````````````````````````````````````````````
   double     MTF_Bar_M5_0_High    = iHigh(  NULL,PERIOD_M5,0);
   double     MTF_Bar_M5_0_Low     = iLow(   NULL,PERIOD_M5,0);
   double     MTF_Bar_M5_0_Open    = iOpen(  NULL,PERIOD_M5,0);
   double     MTF_Bar_M5_0_Close   = iClose( NULL,PERIOD_M5,0);
   datetime   MTF_Bar_M5_0_Time    = iTime(  NULL,PERIOD_M5,0);
   long       MTF_Bar_M5_0_Volume  = iVolume(NULL,PERIOD_M5,0);
   GlobalVariableSet("_GV_SIMAN_M5_0_High",    MTF_Bar_M5_0_High);
   GlobalVariableSet("_GV_SIMAN_M5_0_Low",     MTF_Bar_M5_0_Low);
   GlobalVariableSet("_GV_SIMAN_M5_0_Open",    MTF_Bar_M5_0_Open);
   GlobalVariableSet("_GV_SIMAN_M5_0_Close",   MTF_Bar_M5_0_Close);
   GlobalVariableSet("_GV_SIMAN_M5_0_Time",    MTF_Bar_M5_0_Time);
   GlobalVariableSet("_GV_SIMAN_M5_0_Volume",  MTF_Bar_M5_0_Volume);
// `````````````````````````````````````````````````````````````
   double     MTF_Bar_M15_0_High    = iHigh(  NULL,PERIOD_M15,0);
   double     MTF_Bar_M15_0_Low     = iLow(   NULL,PERIOD_M15,0);
   double     MTF_Bar_M15_0_Open    = iOpen(  NULL,PERIOD_M15,0);
   double     MTF_Bar_M15_0_Close   = iClose( NULL,PERIOD_M15,0);
   datetime   MTF_Bar_M15_0_Time    = iTime(  NULL,PERIOD_M15,0);
   long       MTF_Bar_M15_0_Volume  = iVolume(NULL,PERIOD_M15,0);
   GlobalVariableSet("_GV_SIMAN_M15_0_High",  MTF_Bar_M15_0_High);
   GlobalVariableSet("_GV_SIMAN_M15_0_Low",   MTF_Bar_M15_0_Low);
   GlobalVariableSet("_GV_SIMAN_M15_0_Open",  MTF_Bar_M15_0_Open);
   GlobalVariableSet("_GV_SIMAN_M15_0_Close", MTF_Bar_M15_0_Close);
   GlobalVariableSet("_GV_SIMAN_M15_0_Time",  MTF_Bar_M15_0_Time);
   GlobalVariableSet("_GV_SIMAN_M15_0_Volume",MTF_Bar_M15_0_Volume);
// `````````````````````````````````````````````````````````````
   double     MTF_Bar_M30_0_High    = iHigh(  NULL,PERIOD_M30,0);
   double     MTF_Bar_M30_0_Low     = iLow(   NULL,PERIOD_M30,0);
   double     MTF_Bar_M30_0_Open    = iOpen(  NULL,PERIOD_M30,0);
   double     MTF_Bar_M30_0_Close   = iClose( NULL,PERIOD_M30,0);
   datetime   MTF_Bar_M30_0_Time    = iTime(  NULL,PERIOD_M30,0);
   long       MTF_Bar_M30_0_Volume  = iVolume(NULL,PERIOD_M30,0);
   GlobalVariableSet("_GV_SIMAN_M30_0_High",  MTF_Bar_M30_0_High);
   GlobalVariableSet("_GV_SIMAN_M30_0_Low",   MTF_Bar_M30_0_Low);
   GlobalVariableSet("_GV_SIMAN_M30_0_Open",  MTF_Bar_M30_0_Open);
   GlobalVariableSet("_GV_SIMAN_M30_0_Close", MTF_Bar_M30_0_Close);
   GlobalVariableSet("_GV_SIMAN_M30_0_Time",  MTF_Bar_M30_0_Time);
   GlobalVariableSet("_GV_SIMAN_M30_0_Volume",MTF_Bar_M30_0_Volume);
// `````````````````````````````````````````````````````````````
   double     MTF_Bar_H1_0_High    = iHigh(  NULL,PERIOD_H1,0);
   double     MTF_Bar_H1_0_Low     = iLow(   NULL,PERIOD_H1,0);
   double     MTF_Bar_H1_0_Open    = iOpen(  NULL,PERIOD_H1,0);
   double     MTF_Bar_H1_0_Close   = iClose( NULL,PERIOD_H1,0);
   datetime   MTF_Bar_H1_0_Time    = iTime(  NULL,PERIOD_H1,0);
   long       MTF_Bar_H1_0_Volume  = iVolume(NULL,PERIOD_H1,0);
   GlobalVariableSet("_GV_SIMAN_H1_0_High",  MTF_Bar_H1_0_High);
   GlobalVariableSet("_GV_SIMAN_H1_0_Low",   MTF_Bar_H1_0_Low);
   GlobalVariableSet("_GV_SIMAN_H1_0_Open",  MTF_Bar_H1_0_Open);
   GlobalVariableSet("_GV_SIMAN_H1_0_Close", MTF_Bar_H1_0_Close);
   GlobalVariableSet("_GV_SIMAN_H1_0_Time",  MTF_Bar_H1_0_Time);
   GlobalVariableSet("_GV_SIMAN_H1_0_Volume",MTF_Bar_H1_0_Volume);
// `````````````````````````````````````````````````````````````
   double     MTF_Bar_H4_0_High    = iHigh(  NULL,PERIOD_H4,0);
   double     MTF_Bar_H4_0_Low     = iLow(   NULL,PERIOD_H4,0);
   double     MTF_Bar_H4_0_Open    = iOpen(  NULL,PERIOD_H4,0);
   double     MTF_Bar_H4_0_Close   = iClose( NULL,PERIOD_H4,0);
   datetime   MTF_Bar_H4_0_Time    = iTime(  NULL,PERIOD_H4,0);
   long       MTF_Bar_H4_0_Volume  = iVolume(NULL,PERIOD_H4,0);
   GlobalVariableSet("_GV_SIMAN_H4_0_High",  MTF_Bar_H4_0_High);
   GlobalVariableSet("_GV_SIMAN_H4_0_Low",   MTF_Bar_H4_0_Low);
   GlobalVariableSet("_GV_SIMAN_H4_0_Open",  MTF_Bar_H4_0_Open);
   GlobalVariableSet("_GV_SIMAN_H4_0_Close", MTF_Bar_H4_0_Close);
   GlobalVariableSet("_GV_SIMAN_H4_0_Time",  MTF_Bar_H4_0_Time);
   GlobalVariableSet("_GV_SIMAN_H4_0_Volume",MTF_Bar_H4_0_Volume);
// `````````````````````````````````````````````````````````````
   double     MTF_Bar_D1_0_High    = iHigh(  NULL,PERIOD_D1,0);
   double     MTF_Bar_D1_0_Low     = iLow(   NULL,PERIOD_D1,0);
   double     MTF_Bar_D1_0_Open    = iOpen(  NULL,PERIOD_D1,0);
   double     MTF_Bar_D1_0_Close   = iClose( NULL,PERIOD_D1,0);
   datetime   MTF_Bar_D1_0_Time    = iTime(  NULL,PERIOD_D1,0);
   long       MTF_Bar_D1_0_Volume  = iVolume(NULL,PERIOD_D1,0);
   GlobalVariableSet("_GV_SIMAN_D1_0_High",  MTF_Bar_D1_0_High);
   GlobalVariableSet("_GV_SIMAN_D1_0_Low",   MTF_Bar_D1_0_Low);
   GlobalVariableSet("_GV_SIMAN_D1_0_Open",  MTF_Bar_D1_0_Open);
   GlobalVariableSet("_GV_SIMAN_D1_0_Close", MTF_Bar_D1_0_Close);
   GlobalVariableSet("_GV_SIMAN_D1_0_Time",  MTF_Bar_D1_0_Time);
   GlobalVariableSet("_GV_SIMAN_D1_0_Volume",MTF_Bar_D1_0_Volume);
// `````````````````````````````````````````````````````````````
   double     MTF_Bar_W1_0_High    = iHigh(  NULL,PERIOD_W1,0);
   double     MTF_Bar_W1_0_Low     = iLow(   NULL,PERIOD_W1,0);
   double     MTF_Bar_W1_0_Open    = iOpen(  NULL,PERIOD_W1,0);
   double     MTF_Bar_W1_0_Close   = iClose( NULL,PERIOD_W1,0);
   datetime   MTF_Bar_W1_0_Time    = iTime(  NULL,PERIOD_W1,0);
   long       MTF_Bar_W1_0_Volume  = iVolume(NULL,PERIOD_W1,0);
   GlobalVariableSet("_GV_SIMAN_W1_0_High",  MTF_Bar_W1_0_High);
   GlobalVariableSet("_GV_SIMAN_W1_0_Low",   MTF_Bar_W1_0_Low);
   GlobalVariableSet("_GV_SIMAN_W1_0_Open",  MTF_Bar_W1_0_Open);
   GlobalVariableSet("_GV_SIMAN_W1_0_Close", MTF_Bar_W1_0_Close);
   GlobalVariableSet("_GV_SIMAN_W1_0_Time",  MTF_Bar_W1_0_Time);
   GlobalVariableSet("_GV_SIMAN_W1_0_Volume",MTF_Bar_W1_0_Volume);
// EO DEFINE PARAMETERS FOR THE LAST==CURRENT OPEN MTF CANDLE
// ----------------------------------------------------------
   if(Handle_Time!=Time[0]) {
      Handle_Time                 = Time[0];
      datetime LTF_Time_0         = Time[0];
//      double   MTF_Open_0         = Open[0];
      GlobalVariableSet("_GV_SIMAN_BB_Time_0", LTF_Time_0);
//      GlobalVariableSet("_GV_SIMAN_BB_Open_0", MTF_Open_0);
//      Comment(
//         "\n" +
//         "\n" +
//         "\n" + "LTF_Time_0      = " + TimeToStr(LTF_Time_0, TIME_DATE|TIME_MINUTES) +
//         "\n" + "MTF_Open_0      = " + MTF_Open_0 +
//         "\n" +
//      "\n");
// ----------------------------------------------------------
// THESE TERMINAL VARIABLES WILL BE USED IN [ChartNavigate(0, CHART_CURRENT_POS, 1)]
// <= SHIFTING CHART WHEN NEW CANDLE IN APPROPRIATE TIMEFRAME WILL BE CREATED
      //GlobalVariableSet("_GV_SIMAN_Time_1_W1",  LTF_Time_0);
      //GlobalVariableSet("_GV_SIMAN_Time_1_D1",  LTF_Time_0);
      //GlobalVariableSet("_GV_SIMAN_Time_1_H4",  LTF_Time_0);
      //GlobalVariableSet("_GV_SIMAN_Time_1_H1",  LTF_Time_0);
      //GlobalVariableSet("_GV_SIMAN_Time_1_M30", LTF_Time_0);
      //GlobalVariableSet("_GV_SIMAN_Time_1_M15", LTF_Time_0);
      //GlobalVariableSet("_GV_SIMAN_Time_1_M5",  LTF_Time_0);
//Print("=======================================");
//Print("iTime(NULL,PERIOD_D1,0) = ", iTime(NULL,PERIOD_D1,0) );
//Print("iTime(NULL,PERIOD_H4,0) = ", iTime(NULL,PERIOD_H4,0) );
//Print("iTime(NULL,PERIOD_H1,0) = ", iTime(NULL,PERIOD_H1,0) );
////Print("iTime(NULL,PERIOD_H1,1) = ", iTime(NULL,PERIOD_H1,1) );
////Print("iTime(NULL,PERIOD_H1,2) = ", iTime(NULL,PERIOD_H1,2) );
//Print("iTime(NULL,PERIOD_M30,0) = ", iTime(NULL,PERIOD_M30,0) );
//Print("iTime(NULL,PERIOD_M15,0) = ", iTime(NULL,PERIOD_M15,0) );
//Print("Time[0] = ", Time[0] );
//Print("Time[1] = ", Time[1] );
//Print("=======================================");
      if(iTime(NULL,PERIOD_M5,0)!=Time_Last_Bar_M5) {
         Time_Prev_Bar_M5 = Time_Last_Bar_M5;
         Time_Last_Bar_M5 = iTime(NULL,PERIOD_M5,0);
         GlobalVariableSet("_GV_SIMAN_Time_1_M5",  Time_Last_Bar_M5);
         //   Print("BINGO M5 !!!!!!!!!!");
      }
      if(iTime(NULL,PERIOD_M15,0)!=Time_Last_Bar_M15) {
         Time_Prev_Bar_M15 = Time_Last_Bar_M15;
         Time_Last_Bar_M15 = iTime(NULL,PERIOD_M15,0);
         GlobalVariableSet("_GV_SIMAN_Time_1_M15",  Time_Last_Bar_M15);
         //   Print("BINGO M15 !!!!!!!!!!");
      }
      if(iTime(NULL,PERIOD_M30,0)!=Time_Last_Bar_M30) {
         Time_Prev_Bar_M30 = Time_Last_Bar_M30;
         Time_Last_Bar_M30 = iTime(NULL,PERIOD_M30,0);
         GlobalVariableSet("_GV_SIMAN_Time_1_M30",  Time_Last_Bar_M30);
         //   Print("BINGO M30 !!!!!!!!!!");
      }
      if(iTime(NULL,PERIOD_H1,0)!=Time_Last_Bar_H1) {
         Time_Prev_Bar_H1 = Time_Last_Bar_H1;
         Time_Last_Bar_H1 = iTime(NULL,PERIOD_H1,0);
         GlobalVariableSet("_GV_SIMAN_Time_1_H1",  Time_Last_Bar_H1);
         //   Print("BINGO H1 !!!!!!!!!!");
      }
      if(iTime(NULL,PERIOD_H4,0)!=Time_Last_Bar_H4) {
         Time_Prev_Bar_H4 = Time_Last_Bar_H4;
         Time_Last_Bar_H4 = iTime(NULL,PERIOD_H4,0);
         GlobalVariableSet("_GV_SIMAN_Time_1_H4",  Time_Last_Bar_H4);
         //   Print("BINGO H4 !!!!!!!!!!");
      }
      if(iTime(NULL,PERIOD_D1,0)!=Time_Last_Bar_D1) {
         Time_Prev_Bar_D1 = Time_Last_Bar_D1;
         Time_Last_Bar_D1 = iTime(NULL,PERIOD_D1,0);
         GlobalVariableSet("_GV_SIMAN_Time_1_D1",  Time_Last_Bar_D1);
         //   Print("BINGO D1 !!!!!!!!!!");
      }
      if(iTime(NULL,PERIOD_W1,0)!=Time_Last_Bar_W1) {
         Time_Prev_Bar_W1 = Time_Last_Bar_W1;
         Time_Last_Bar_W1 = iTime(NULL,PERIOD_W1,0);
         GlobalVariableSet("_GV_SIMAN_Time_1_W1",  Time_Last_Bar_W1);
         //   Print("BINGO W1 !!!!!!!!!!");
      }
   } // if(Handle_Time!=Time[0]) {
// EO DEFINE TERMINAL VARIABLES - THEY WILL BE USED BY INDICATORS IN SEPARATE WINDOWS IN ORDER TO CLOSE BARS IN THE FUTURE
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
   FUNCTION_EQUITY_DRAWDOWN();
   Current_Time                   = TimeCurrent();
   Time_Trading_Session_Start     = StrToTime(Trading_Session_Start);
   Time_Trading_Session_End       = StrToTime(Trading_Session_End);
   FUNCTION_SHOW_THERESHOLD_BUY_SELL_MARKS();
   FUNCTION_ADR_LEVELS();
   FUNCTION_SESSION_RECTANGLES();
   FUNCTION_DRAW_TLINES();
   if( (Current_Time>=Time_Trading_Session_Start   &&   Current_Time<Time_Trading_Session_End   &&   SM_7_Mode_Trading_Session==true)   ||   SM_7_Mode_Trading_Session==false ) {
      // OPENING NEW ORDERS ---
      FUNCTION_OPEN___BUYSTOP_SELLSTOP();
      FUNCTION_OPEN___BUYLIMIT_SELLLIMIT();
      FUNCTION_OPEN___BUYREAL_SELLREAL();  // MARKET ORDERS
      // EO OPENING NEW ORDERS ---
   } // if( (Current_Time>=Time_Trading_Session_Start   &&   Current_Time<Time_Trading_Session_End)   ||   Status_Use_Trading_Session==false ) {
   FUNCTION_DELETE_HLINES();
   FUNCTION_SHOW_ORDERS_MANAGE();
// ### ##########################################################################################################
   if(OrdersTotal()>0) {
      for(int cnt_12=OrdersTotal()-1; cnt_12>=0; cnt_12--) {
         if(OrderSelect(cnt_12, SELECT_BY_POS, MODE_TRADES)==true) {
            if(OrderSymbol()==Symbol()   &&   OrderMagicNumber()==My_Magic_Number) {
               // ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
               // If There is Order Open and no corresponding "H"LINES => Create "H"LINES
               if(ObjectFind(MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0))==-1 || ObjectFind(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0))==-1 || ObjectFind(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0))==-1 ) {
//                FUNCTION_DRAW_HLINE_OP_TP_SL(Order_Open_Price, TP, SL, Order_Type, TicketBuyReal);
                  FUNCTION_DRAW_HLINE_OP_TP_SL(OrderOpenPrice(), OrderTakeProfit(), OrderStopLoss(), OrderType(), OrderTicket());
               }
               // EO If There is Order Open and no corresponding "H"LINES => Create "H"LINES
               // ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
// Delete STOP/LIMIT Orders if corresponded SL/TP Line IS ABOVE/BELOW ITS ORDER_OPEN_PRICE
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// OP_BUYLIMIT / OP_BUYSTOP
               if(OrderType()==OP_BUYLIMIT   ||   OrderType()==OP_BUYSTOP) {
                  if( ObjectFind(  MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0))!=-1) {
                     if( ObjectGet(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1)>OrderOpenPrice() ) {
                        bool Buy_LIMIT_Delete       = OrderDelete(OrderTicket());
                        if(Buy_LIMIT_Delete==true) {
                           Alert(Symbol(), ": Successfully Deleted Order BUY STOP/LIMIT!     #", OrderTicket() );
                           ObjectDelete(MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0));
                           ObjectDelete(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0));
                           ObjectDelete(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0));
                           break;
                        }
                        if(FUNCTION_ERROR_REPORT(GetLastError())==1) {
                           Alert(Symbol(), ": ----------- Error - BUY STOP/LIMIT: Could Not Delete Order BUY STOP/LIMIT", OrderTicket());
                           continue;                                                    // Повторная попытка
                        }
                     }
                  }
                  if( ObjectFind(  MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0))!=-1) {
                     if( ObjectGet(MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1)<OrderOpenPrice() ) {
                        bool Buy_LIMIT_Delete2      = OrderDelete(OrderTicket());
                        if(Buy_LIMIT_Delete2==true) {
                           Alert(Symbol(), ": Successfully Deleted Order BUY STOP/LIMIT!     #", OrderTicket() );
                           ObjectDelete(MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0));
                           ObjectDelete(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0));
                           ObjectDelete(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0));
                           break;
                        }
                        if(FUNCTION_ERROR_REPORT(GetLastError())==1) {
                           Alert(Symbol(), ": ----------- Error - BUY STOP/LIMIT: Could Not Delete Order BUY STOP/LIMIT", OrderTicket());
                           continue;                                                    // Повторная попытка
                        }
                     }
                  }
               }
// EO OP_BUYLIMIT / OP_BUYSTOP
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// OP_SELLLIMIT / OP_SELLSTOP
               if(OrderType()==OP_SELLLIMIT   ||   OrderType()==OP_SELLSTOP) {
                  if( ObjectFind(  MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0))!=-1) {
                     if( ObjectGet(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1)<OrderOpenPrice() ) {
                        bool Sell_LIMIT_Delete      = OrderDelete(OrderTicket());
                        if(Sell_LIMIT_Delete==true) {
                           Alert(Symbol(), ": Successfully Deleted Order SELL STOP/LIMIT!     #", OrderTicket());
                           ObjectDelete(MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0));
                           ObjectDelete(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0));
                           ObjectDelete(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0));
                           break;
                        }
                        if(FUNCTION_ERROR_REPORT(GetLastError())==1) {
                           Alert(Symbol(), ": ----------- Error - SELL LIMIT: Could Not Delete Order SELL STOP/LIMIT", OrderTicket());
                           continue;                                                    // Повторная попытка
                        }
                     }
                  }
                  if( ObjectFind(  MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0))!=-1) {
                     if( ObjectGet(MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1)>OrderOpenPrice() ) {
                        bool Sell_LIMIT_Delete2     = OrderDelete(OrderTicket());
                        if(Sell_LIMIT_Delete2==true) {
                           Alert(Symbol(), ": Successfully Deleted Order SELL STOP/LIMIT!     #", OrderTicket());
                           ObjectDelete(MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0));
                           ObjectDelete(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0));
                           ObjectDelete(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0));
                           break;
                        }
                        if(FUNCTION_ERROR_REPORT(GetLastError())==1) {
                           Alert(Symbol(), ": ----------- Error - SELL LIMIT: Could Not Delete Order SELL STOP/LIMIT", OrderTicket());
                           continue;                                                    // Повторная попытка
                        }
                     }
                  }
               }
// EO OP_SELLLIMIT / OP_SELLSTOP
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// EO Delete STOP/LIMIT Orders if corresponded SL/TP Line IS ABOVE/BELOW ITS ORDER_OPEN_PRICE
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
// Delete REAL Orders if corresponded SL/TP Line IS ABOVE/BELOW ITS ORDER_OPEN_PRICE
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// BUY REAL
               if(OrderType()==OP_BUY) {
                  if( ObjectFind(  MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0))!=-1) {
                     if( ObjectGet(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1)>MathMax(Bid,OrderOpenPrice()) ) {
                        bool Buy_Delete = OrderClose(OrderTicket(),OrderLots(),Bid,Slippage,Green);
                        if(Buy_Delete==true) {
                           Alert(Symbol(), ": Successfully CLOSED Order BUY REAL!     #", OrderTicket());
                           ObjectDelete(MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0));
                           ObjectDelete(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0));
                           ObjectDelete(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0));
                           break;
                        }
                        if(FUNCTION_ERROR_REPORT(GetLastError())==1) {
                           Alert(Symbol(), ": ----------- Error - BUY REAL: Could Not CLOSE Order BUY REAL", OrderTicket());
                           continue;                                                    // Повторная попытка
                        }
                     }
                  }
                  if( ObjectFind(  MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0))!=-1) {
                     if( ObjectGet(MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1)<MathMax(Bid,OrderOpenPrice()) ) {
                        bool Buy_Delete2 = OrderClose(OrderTicket(),OrderLots(),Bid,Slippage,Green);
                        if(Buy_Delete2==true) {
                           Alert(Symbol(), ": Successfully CLOSED Order BUY REAL!     #", OrderTicket());
                           ObjectDelete(MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0));
                           ObjectDelete(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0));
                           ObjectDelete(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0));
                           break;
                        }
                        if(FUNCTION_ERROR_REPORT(GetLastError())==1) {
                           Alert(Symbol(), ": ----------- Error - BUY REAL: Could Not CLOSE Order BUY REAL", OrderTicket());
                           continue;                                                    // Повторная попытка
                        }
                     }
                  }
               }
// EO BUY REAL
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// SELL REAL
               if(OrderType()==OP_SELL) {
                  if( ObjectFind(  MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0))!=-1) {
                     if( ObjectGet(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1)<MathMin(Ask,OrderOpenPrice()) ) {
                        bool Sell_Delete = OrderClose(OrderTicket(),OrderLots(),Ask,Slippage,Red);
                        if(Sell_Delete==true) {
                           Alert(Symbol(), ": Successfully CLOSED Order SELL REAL!     #", OrderTicket());
                           ObjectDelete(MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0));
                           ObjectDelete(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0));
                           ObjectDelete(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0));
                           break;
                        }
                        if(FUNCTION_ERROR_REPORT(GetLastError())==1) {
                           Alert(Symbol(), ": ----------- Error - SELL REAL: Could Not CLOSE Order SELL REAL", OrderTicket());
                           continue;                                                    // Повторная попытка
                        }
                     }
                  }
                  if( ObjectFind(  MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0))!=-1) {
                     if( ObjectGet(MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1)>MathMin(Ask,OrderOpenPrice()) ) {
                        bool Sell_Delete2 = OrderClose(OrderTicket(),OrderLots(),Ask,Slippage,Red);
                        if(Sell_Delete2==true) {
                           Alert(Symbol(), ": Successfully CLOSED Order SELL REAL!     #", OrderTicket());
                           ObjectDelete(MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0));
                           ObjectDelete(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0));
                           ObjectDelete(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0));
                           break;
                        }
                        if(FUNCTION_ERROR_REPORT(GetLastError())==1) {
                           Alert(Symbol(), ": ----------- Error - SELL REAL: Could Not CLOSE Order SELL REAL", OrderTicket());
                           continue;                                                    // Повторная попытка
                        }
                     }
                  }
               }
// EO SELL REAL
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// Delete REAL Orders if corresponded SL/TP Line IS ABOVE/BELOW ITS ORDER_OPEN_PRICE
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// Для Buy
// SL=Bid - StopLoss*  Point;      // StopLoss   (цена)
// TP=Ask + TakeProfit*Point;      // TakeProfit (цена)
// Для Sell
// SL=Ask + StopLoss*  Point;      // StopLoss   (цена)
// TP=Bid - TakeProfit*Point;      // TakeProfit (цена)
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// MODIFY ORDERS BY MANUAL MODIFYING TP / SL / OP ---
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// BUY
               if(OrderType()==OP_BUY   ||   OrderType()==OP_BUYSTOP   ||   OrderType()==OP_BUYLIMIT) {
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// TP ---
                  if( ObjectFind(MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0))!=-1) {
                     if(MathAbs(OrderTakeProfit() - ObjectGet(MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1))>SM_8_Hard_Limit_StopLevel*PointX ) {
                        if((ObjectGet(MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1) - OrderOpenPrice())<SM_8_Hard_Limit_StopLevel*PointX ) {
                           Alert(Symbol(), ": ----------- WARNING - BUY REAL/STOP/LIMIT: TP too close to OrderOpenPrice    #", OrderTicket());
                           ObjectSet(MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1, OrderTakeProfit()) ;
                           break;
                           return(0);
                        }
                        if((ObjectGet(MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1) - OrderOpenPrice())>=SM_8_Hard_Limit_StopLevel*PointX ) {
                           bool BUY_STOP_Modify_TP = OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(), NormalizeDouble(ObjectGet(MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1),Digits), 0,Orchid);
                           if(BUY_STOP_Modify_TP==true) {
                              Alert(Symbol(), ": Modifying BUY REAL/STOP/LIMIT TP Succeeded   #", OrderTicket() );
                              break;
                           }
                           if(FUNCTION_ERROR_REPORT(GetLastError())==1) {
                              Alert(Symbol(), ": ----------- Error - BUY REAL/STOP/LIMIT: TP Could Not be Modified   #", OrderTicket());
                              continue;                                                    // Повторная попытка
                           }
                        }
                     }
                  }
// EO TP ---
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// SL ---
                  if(OrderType()==OP_BUYSTOP   ||   OrderType()==OP_BUYLIMIT) {
                     if( ObjectFind(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0))!=-1) {
                        if(MathAbs(OrderStopLoss() - ObjectGet(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1))>SM_8_Hard_Limit_StopLevel*PointX   ) {
                           if((OrderOpenPrice() - ObjectGet(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1))<SM_8_Hard_Limit_StopLevel*PointX ) {
                              Alert(Symbol(), ": ----------- WARNING - BUY REAL/STOP/LIMIT: SL too close to OrderOpenPrice    #", OrderTicket());
                              ObjectSet(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1, OrderStopLoss()) ;
                              break;
                              return(0);
                           }
                           if((OrderOpenPrice() - ObjectGet(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1))>=SM_8_Hard_Limit_StopLevel*PointX ) {
                              bool BUY_STOP_Modify_SL = OrderModify(OrderTicket(),OrderOpenPrice(), NormalizeDouble(ObjectGet(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1),Digits), OrderTakeProfit(), 0,Orchid);
                              if(BUY_STOP_Modify_SL==true) {
                                 Alert(Symbol(), ": Modifying BUY REAL/STOP/LIMIT SL Succeeded   #", OrderTicket());
                                 break;
                              }
                              if(FUNCTION_ERROR_REPORT(GetLastError())==1) {
                                 Alert(Symbol(), ": ----------- Error - BUY REAL/STOP/LIMIT: SL Could Not be Modified   #", OrderTicket());
                                 continue;                                                    // Повторная попытка
                              }
                           }
                        }
                     }
                  }
                  if(OrderType()==OP_BUY) {
                     if( ObjectFind(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0))!=-1) {
                        if(MathAbs(OrderStopLoss() - ObjectGet(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1))>SM_8_Hard_Limit_StopLevel*PointX   ) {
                           if((MathMax(Bid,OrderOpenPrice()) - ObjectGet(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1))<SM_8_Hard_Limit_StopLevel*PointX ) {
                              Alert(Symbol(), ": ----------- WARNING - BUY REAL: SL too close to OrderOpenPrice    #", OrderTicket());
                              ObjectSet(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1, OrderStopLoss()) ;
                              break;
                              return(0);
                           }
                           if((MathMax(Bid,OrderOpenPrice()) - ObjectGet(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1))>=SM_8_Hard_Limit_StopLevel*PointX ) {
                              bool BUY_REAL_Modify_SL = OrderModify(OrderTicket(),OrderOpenPrice(), NormalizeDouble(ObjectGet(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1),Digits), OrderTakeProfit(), 0,Orchid);
                              if(BUY_REAL_Modify_SL==true) {
                                 Alert(Symbol(), ": Modifying BUY REAL SL Succeeded   #", OrderTicket());
                                 break;
                              }
                              if(FUNCTION_ERROR_REPORT(GetLastError())==1) {
                                 Alert(Symbol(), ": ----------- Error - BUY REAL: SL Could Not be Modified   #", OrderTicket());
                                 continue;                                                    // Повторная попытка
                              }
                           }
                        }
                     }
                  }
// EO SL ---
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
               } // if(OrderType()==OP_BUY   ||   OrderType()==OP_BUYSTOP   ||   OrderType()==OP_BUYLIMIT) {
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// OP ---
               if(OrderType()==OP_BUY) {
                  if( ObjectFind( MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0))!=-1) {
                     if(ObjectGet(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1)!=OrderOpenPrice() ) {
                        ObjectSet(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1, OrderOpenPrice()) ;
                        break;
                        return(0);
                     }
                  }
               } // if(OrderType()==OP_BUY) {
               if(OrderType()==OP_BUYSTOP) {
                  if( ObjectFind(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0))!=-1) {
                     if(MathAbs(OrderOpenPrice() - ObjectGet(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1))>1*PointX   ) {
                        if((ObjectGet(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1) - Ask)<SM_8_Hard_Limit_StopLevel*PointX ) {
                           Alert(Symbol(), ": ----------- WARNING - BUY STOP: OP too close to Ask/OrderOpenPrice    #", OrderTicket());
                           ObjectSet(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1, OrderOpenPrice()) ;
                           break;
                           return(0);
                        }
                        if((ObjectGet(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1) - Ask)>=SM_8_Hard_Limit_StopLevel*PointX ) {
                           double BUYSTOP_OP         = NormalizeDouble(ObjectGet(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1),Digits);
                           double BUYSTOP_SL         = NormalizeDouble(BUYSTOP_OP-(OrderOpenPrice()-OrderStopLoss()),Digits);
                           double BUYSTOP_TP         = NormalizeDouble(BUYSTOP_OP+(OrderTakeProfit()-OrderOpenPrice()),Digits);
                           bool   BUY_STOP_Modify_OP = OrderModify(OrderTicket(),BUYSTOP_OP, BUYSTOP_SL, BUYSTOP_TP, 0,Orchid);
                           if(BUY_STOP_Modify_OP==true) {
                              Alert(Symbol(), ": Modifying BUY STOP OP Succeeded   #", OrderTicket());
                              ObjectSet(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1, BUYSTOP_SL) ;
                              ObjectSet(MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1, BUYSTOP_TP) ;
                              if(SM__10_Make_TESTER_Template==true) {
                                 string       Rect_Buy   = "MyLine_RECT_Buy_"+Time[0];
                                 ObjectCreate(Rect_Buy, OBJ_RECTANGLE, 0,  Time[0],High[1]+Threshold_Buy*PointX,  Time[0]-Period()*4*60,High[1]-30*PointX);
                                 ObjectSet(   Rect_Buy, OBJPROP_STYLE, STYLE_SOLID);
                                 ObjectSet(   Rect_Buy, OBJPROP_RAY, False);
                                 ObjectSet(   Rect_Buy, OBJPROP_WIDTH, 1);
                                 ObjectSet(   Rect_Buy, OBJPROP_BACK, True);
                                 ObjectSet(   Rect_Buy, OBJPROP_COLOR, Color_Buy);
                              } // if(SM__10_Make_TESTER_Template==true) {
                              break;
                           }
                           if(FUNCTION_ERROR_REPORT(GetLastError())==1) {
                              Alert(Symbol(), ": ----------- Error - BUY STOP: OP Could Not be Modified   #", OrderTicket());
                              continue;                                                    // Повторная попытка
                           }
                        }
                     }
                  }
               } // if(OrderType()==OP_BUYSTOP) {
               if(OrderType()==OP_BUYLIMIT) {
                  if( ObjectFind(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0))!=-1) {
                     if(MathAbs(OrderOpenPrice() - ObjectGet(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1))>1*PointX   ) {
                        if((Bid - ObjectGet(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1))<SM_8_Hard_Limit_StopLevel*PointX ) {
                           Alert(Symbol(), ": ----------- WARNING - BUY LIMIT: OP too close to Ask/OrderOpenPrice    #", OrderTicket());
                           ObjectSet(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1, OrderOpenPrice()) ;
                           break;
                           return(0);
                        }
                        if((Bid - ObjectGet(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1))>=SM_8_Hard_Limit_StopLevel*PointX ) {
                           double BUYLIMIT_OP         = NormalizeDouble(ObjectGet(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1),Digits);
                           double BUYLIMIT_SL         = NormalizeDouble(BUYLIMIT_OP-(OrderOpenPrice()-OrderStopLoss()),Digits);
                           double BUYLIMIT_TP         = NormalizeDouble(BUYLIMIT_OP+(OrderTakeProfit()-OrderOpenPrice()),Digits);
                           bool   BUY_LIMIT_Modify_OP = OrderModify(OrderTicket(),BUYLIMIT_OP, BUYLIMIT_SL, BUYLIMIT_TP, 0,Orchid);
                           if(BUY_LIMIT_Modify_OP==true) {
                              Alert(Symbol(), ": Modifying BUY LIMIT OP Succeeded   #", OrderTicket());
                              ObjectSet(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1, BUYLIMIT_SL) ;
                              ObjectSet(MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1, BUYLIMIT_TP) ;
                              break;
                           }
                           if(FUNCTION_ERROR_REPORT(GetLastError())==1) {
                              Alert(Symbol(), ": ----------- Error - BUY LIMIT: OP Could Not be Modified   #", OrderTicket());
                              continue;                                                    // Повторная попытка
                           }
                        }
                     }
                  }
               } // if(OrderType()==OP_BUYLIMIT) {
// OP ---
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// BUY
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// SELL
               if(OrderType()==OP_SELL   ||   OrderType()==OP_SELLSTOP   ||   OrderType()==OP_SELLLIMIT) {
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// TP ---
                  if( ObjectFind(MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0))!=-1) {
                     if(MathAbs(ObjectGet(MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1)-OrderTakeProfit())>SM_8_Hard_Limit_StopLevel*PointX   ) {
                        if((OrderOpenPrice() - ObjectGet(MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1))<SM_8_Hard_Limit_StopLevel*PointX ) {
                           Alert(Symbol(), ": ----------- WARNING - SELL REAL/STOP/LIMIT: TP too close to OrderOpenPrice    #", OrderTicket());
                           ObjectSet(MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1, OrderTakeProfit()) ;
                           break;
                           return(0);
                        }
                        if((OrderOpenPrice() - ObjectGet(MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1))>=SM_8_Hard_Limit_StopLevel*PointX ) {
                           bool SELL_STOP_Modify_TP = OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(), NormalizeDouble(ObjectGet(MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1),Digits), 0,Orchid);
                           if(SELL_STOP_Modify_TP==true) {
                              Alert(Symbol(), ": Modifying SELL REAL/STOP/LIMIT TP Succeeded   #", OrderTicket() );
                              break;
                           }
                           if(FUNCTION_ERROR_REPORT(GetLastError())==1) {
                              Alert(Symbol(), ": ----------- Error - SELL REAL/STOP/LIMIT: TP Could Not be Modified   #", OrderTicket());
                              continue;                                                    // Повторная попытка
                           }
                        }
                     }
                  }
// EO TP ---
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// SL ---
                  if(OrderType()==OP_SELLSTOP   ||   OrderType()==OP_SELLLIMIT) {
                     if( ObjectFind(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0))!=-1) {
                        if(MathAbs(OrderStopLoss() - ObjectGet(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1))>SM_8_Hard_Limit_StopLevel*PointX   ) {
                           if((ObjectGet(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1) - OrderOpenPrice())<SM_8_Hard_Limit_StopLevel*PointX ) {
                              Alert(Symbol(), ": ----------- WARNING - SELL REAL/STOP/LIMIT: SL too close to OrderOpenPrice    #", OrderTicket());
                              ObjectSet(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1, OrderStopLoss()) ;
                              break;
                              return(0);
                           }
                           if((ObjectGet(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1) - OrderOpenPrice())>=SM_8_Hard_Limit_StopLevel*PointX ) {
                              bool SELL_STOP_Modify_SL = OrderModify(OrderTicket(),OrderOpenPrice(), NormalizeDouble(ObjectGet(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1),Digits), OrderTakeProfit(), 0,Orchid);
                              if(SELL_STOP_Modify_SL==true) {
                                 Alert(Symbol(), ": Modifying SELL REAL/STOP/LIMIT SL Succeeded   #", OrderTicket());
                                 break;
                              }
                              if(FUNCTION_ERROR_REPORT(GetLastError())==1) {
                                 Alert(Symbol(), ": ----------- Error - SELL REAL/STOP/LIMIT: SL Could Not be Modified   #", OrderTicket());
                                 continue;                                                    // Повторная попытка
                              }
                           }
                        }
                     }
                  }
                  if(OrderType()==OP_SELL) {
                     if( ObjectFind(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0))!=-1) {
                        if(MathAbs(OrderStopLoss() - ObjectGet(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1))>SM_8_Hard_Limit_StopLevel*PointX   ) {
                           if((ObjectGet(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1) - MathMin(Ask,OrderOpenPrice()))<SM_8_Hard_Limit_StopLevel*PointX ) {
                              Alert(Symbol(), ": ----------- WARNING - SELL REAL: SL too close to OrderOpenPrice    #", OrderTicket());
                              ObjectSet(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1, OrderStopLoss()) ;
                              break;
                              return(0);
                           }
                           if((ObjectGet(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1) - MathMin(Ask,OrderOpenPrice()))>=SM_8_Hard_Limit_StopLevel*PointX ) {
                              bool SELL_REAL_Modify_SL = OrderModify(OrderTicket(),OrderOpenPrice(), NormalizeDouble(ObjectGet(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1),Digits), OrderTakeProfit(), 0,Orchid);
                              if(SELL_REAL_Modify_SL==true) {
                                 Alert(Symbol(), ": Modifying SELL REAL SL Succeeded   #", OrderTicket());
                                 break;
                              }
                              if(FUNCTION_ERROR_REPORT(GetLastError())==1) {
                                 Alert(Symbol(), ": ----------- Error - SELL REAL: SL Could Not be Modified   #", OrderTicket());
                                 continue;                                                    // Повторная попытка
                              }
                           }
                        }
                     }
                  }
// EO SL ---
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
               } // if(OrderType()==OP_SELL   ||   OrderType()==OP_SELLSTOP   ||   OrderType()==OP_SELLLIMIT) {
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// OP ---
               if(OrderType()==OP_SELL) {
                  if( ObjectFind( MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0))!=-1) {
                     if(ObjectGet(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1)!=OrderOpenPrice() ) {
                        ObjectSet(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1, OrderOpenPrice()) ;
                        break;
                        return(0);
                     }
                  }
               } // if(OrderType()==OP_SELL) {
               if(OrderType()==OP_SELLSTOP) {
                  if( ObjectFind(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0))!=-1) {
                     if(MathAbs(OrderOpenPrice() - ObjectGet(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1))>1*PointX   ) {
                        if((Bid - ObjectGet(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1))<SM_8_Hard_Limit_StopLevel*PointX ) {
                           Alert(Symbol(), ": ----------- WARNING - SELL STOP: OP too close to Bid/OrderOpenPrice    #", OrderTicket());
                           ObjectSet(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1, OrderOpenPrice()) ;
                           break;
                           return(0);
                        }
                        if((Bid - ObjectGet(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1))>=SM_8_Hard_Limit_StopLevel*PointX ) {
                           double SELLSTOP_OP         = NormalizeDouble(ObjectGet(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1),Digits);
                           double SELLSTOP_SL         = NormalizeDouble(SELLSTOP_OP+(OrderStopLoss()-OrderOpenPrice()),Digits);
                           double SELLSTOP_TP         = NormalizeDouble(SELLSTOP_OP-(OrderOpenPrice()-OrderTakeProfit()),Digits);
                           bool   SELL_STOP_Modify_OP = OrderModify(OrderTicket(),SELLSTOP_OP, SELLSTOP_SL, SELLSTOP_TP, 0,Orchid);
                           if(SELL_STOP_Modify_OP==true) {
                              Alert(Symbol(), ": Modifying SELL STOP OP Succeeded   #", OrderTicket());
                              ObjectSet(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1, SELLSTOP_SL) ;
                              ObjectSet(MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1, SELLSTOP_TP) ;
                              if(SM__10_Make_TESTER_Template==true) {
                                 string       Rect_Sell  = "MyLine_RECT_Sell_"+Time[0];
                                 ObjectCreate(Rect_Sell, OBJ_RECTANGLE, 0,  Time[0],Low[1]-Threshold_Sell*PointX,  Time[0]-Period()*4*60,Low[1]+30*PointX);
                                 ObjectSet(   Rect_Sell, OBJPROP_STYLE, STYLE_SOLID);
                                 ObjectSet(   Rect_Sell, OBJPROP_RAY, False);
                                 ObjectSet(   Rect_Sell, OBJPROP_WIDTH, 1);
                                 ObjectSet(   Rect_Sell, OBJPROP_BACK, True);
                                 ObjectSet(   Rect_Sell, OBJPROP_COLOR, Color_Sell);
                              } // if(SM__10_Make_TESTER_Template==true) {
                              break;
                           }
                           if(FUNCTION_ERROR_REPORT(GetLastError())==1) {
                              Alert(Symbol(), ": ----------- Error - SELL STOP: OP Could Not be Modified   #", OrderTicket());
                              continue;                                                    // Повторная попытка
                           }
                        }
                     }
                  }
               } // if(OrderType()==OP_SELLSTOP) {
               if(OrderType()==OP_SELLLIMIT) {
                  if( ObjectFind(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0))!=-1) {
                     if(MathAbs(OrderOpenPrice() - ObjectGet(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1))>1*PointX   ) {
                        if((ObjectGet(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1) - Ask)<SM_8_Hard_Limit_StopLevel*PointX ) {
                           Alert(Symbol(), ": ----------- WARNING - SELL LIMIT: OP too close to Bid/OrderOpenPrice    #", OrderTicket());
                           ObjectSet(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1, OrderOpenPrice()) ;
                           break;
                           return(0);
                        }
                        if((ObjectGet(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1) - Ask)>=SM_8_Hard_Limit_StopLevel*PointX ) {
                           double SELLLIMIT_OP         = NormalizeDouble(ObjectGet(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1),Digits);
                           double SELLLIMIT_SL         = NormalizeDouble(SELLLIMIT_OP+(OrderStopLoss()-OrderOpenPrice()),Digits);
                           double SELLLIMIT_TP         = NormalizeDouble(SELLLIMIT_OP-(OrderOpenPrice()-OrderTakeProfit()),Digits);
                           bool   SELL_LIMIT_Modify_OP = OrderModify(OrderTicket(),SELLLIMIT_OP, SELLLIMIT_SL, SELLLIMIT_TP, 0,Orchid);
                           if(SELL_LIMIT_Modify_OP==true) {
                              Alert(Symbol(), ": Modifying SELL LIMIT OP Succeeded   #", OrderTicket());
                              ObjectSet(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1, SELLLIMIT_SL) ;
                              ObjectSet(MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1, SELLLIMIT_TP) ;
                              break;
                           }
                           if(FUNCTION_ERROR_REPORT(GetLastError())==1) {
                              Alert(Symbol(), ": ----------- Error - SELL LIMIT: OP Could Not be Modified   #", OrderTicket());
                              continue;                                                    // Повторная попытка
                           }
                        }
                     }
                  }
               } // if(OrderType()==OP_SELLLIMIT) {
// OP ---
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// SELL
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// MODIFY ORDERS BY MANUAL MODYIFYING TP / SL / OP ---
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// MOVE SL TO BE
               if(SM_3_Mode_BE==true   &&   OrderCloseTime()==0 ) {
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// BUY ---
                  if(OrderType()==OP_BUY) {
                     if(SM_3_Mode_BE_Equal_SL==true) {
                        SM_3__BE_Fixed                = MathAbs((OrderOpenPrice() - OrderStopLoss()) / PointX);
                     }
                     if(Bid>=(OrderOpenPrice()  + SM_3__BE_Fixed*PointX)   &&   OrderStopLoss()<OrderOpenPrice() ) {
                        double SL_Original_BUY  = OrderStopLoss();
                        bool   Ans_BE_BUY       = OrderModify(OrderTicket(),OrderOpenPrice(),OrderOpenPrice(),OrderTakeProfit(), 0,DeepSkyBlue);
                        Sleep(3000);
                        if(Ans_BE_BUY==true) {
                           ObjectSet(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1, OrderOpenPrice()) ;
                           Alert (Symbol()+": SL BUY which was ", SL_Original_BUY, " Successfully set to >> BreakEven << at ", OrderOpenPrice(), "   Ticket: #"+OrderTicket());
                           return(0);
                        }
                        if(Ans_BE_BUY==false) {
                           Alert (Symbol()+": ----------- Error - Could Not set SL_BUY To BE from ", SL_Original_BUY, " To ", OrderOpenPrice(), "   Ticket: #"+OrderTicket());
                        }
                        if(FUNCTION_ERROR_REPORT(GetLastError())==1) {
                           continue;                                                        // Повторная попытка
                        }
                     } // if(OrderType() == OP_BUY  &&  OrderSymbol()==Symbol() )
                  }
// EO BUY ---
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// SELL ---
                  if(OrderType()==OP_SELL) {
                     if(SM_3_Mode_BE_Equal_SL==true) {
                        SM_3__BE_Fixed                = MathAbs((OrderOpenPrice() - OrderStopLoss()) / PointX);
                     }
                     if(Ask<=(OrderOpenPrice()  - SM_3__BE_Fixed*PointX)   &&   OrderStopLoss()>OrderOpenPrice()  ) {
                        double SL_Original_SELL = OrderStopLoss();
                        bool   Ans_BE_SELL      = OrderModify(OrderTicket(),OrderOpenPrice(),OrderOpenPrice(),OrderTakeProfit(), 0,DeepSkyBlue);
                        Sleep(3000);
                        if(Ans_BE_SELL==true) {
                           ObjectSet(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1, OrderOpenPrice()) ;
                           Alert (Symbol()+": SL SELL which was ", SL_Original_SELL, " Successfully set to >> BreakEven << at ", OrderOpenPrice(), "   Ticket: #"+OrderTicket());
                           return(0);
                        }
                        if(Ans_BE_SELL==false) {
                           Alert (Symbol()+": ----------- Error - Could Not set SL_SELL To BE from ", SL_Original_SELL, " To ", OrderOpenPrice(), "   Ticket: #"+OrderTicket());
                        }
                        if(FUNCTION_ERROR_REPORT(GetLastError())==1) {
                           continue;                                                        // Повторная попытка
                        }
                     } // if(OrderType() == OP_SELL  &&  OrderSymbol()==Symbol() )
                  }
// EO SELL ---
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
               } // if(SM_3_Mode_BE==true   &&   OrdersTotal()>0) {
// EO MOVE SL TO BE
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// MOVE SL TO TS TRAILING
               if(SM_4_Mode_TS==true   &&   OrderCloseTime()==0 ) {
// BUY -----------------------------------------------------------------------------------------
                  if(OrderType()==OP_BUY) {
                     bool cond2_TS_BE_Buy = false;
//            if(SM_4_Mode_TS_On_BE_Only==true   &&   OrderStopLoss()>=OrderOpenPrice()) {
                     if(SM_4_Mode_TS_On_BE_Only==true   &&   ( (SM_4_Mode_TS_On_BE_Only_Once==false && OrderStopLoss()>=OrderOpenPrice()) || (SM_4_Mode_TS_On_BE_Only_Once==true && OrderStopLoss()==OrderOpenPrice()) ) ) {
                        cond2_TS_BE_Buy   = true;
                     }
                     if(SM_4_Mode_TS_On_BE_Only==false) {
                        cond2_TS_BE_Buy   = true;
                     }
//            double TS_2_Buy   = (SM_4_TS_Fixed+SM_4_TS_Fixed*TS_Multiplier)*PointX;
                     double TS_2_Buy   = (SM_4_TS_Fixed+SM_4_TS_Step)*PointX;
                     if(IsTradeAllowed()==false    &&    cond2_TS_BE_Buy==true   &&   Bid>=(TS_2_Buy+OrderStopLoss()) ) {
                        Alert(Symbol()+": ----------- Error - BUY: Торговый поток занят! Нельзя закрыть часть позиции! Ждем!   Ticket: #"+OrderTicket());
                        Sleep(100);
                     }
                     RefreshRates();
                     if(IsTradeAllowed()==true     &&    cond2_TS_BE_Buy==true   &&   Bid>=(TS_2_Buy+OrderStopLoss()) ) {
//               bool Ans_TS_2_Buy = OrderModify(OrderTicket(),OrderOpenPrice(), NormalizeDouble(Bid-SM_4_TS_Fixed*PointX,Digits), OrderTakeProfit(), 0,Red);
                        bool Ans_TS_2_Buy = OrderModify(OrderTicket(),OrderOpenPrice(), NormalizeDouble(OrderStopLoss()+SM_4_TS_Fixed*PointX,Digits), OrderTakeProfit(), 0,Red);
                        Sleep(3000);
                        if(Ans_TS_2_Buy == true) {
                           ObjectSet(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1, NormalizeDouble(OrderStopLoss()+SM_4_TS_Fixed*PointX,Digits) ) ;
                           Alert (Symbol()+": TS BUY Succeeded. New SL = ", NormalizeDouble(Bid-SM_4_TS_Fixed*PointX,Digits), "   Ticket: #"+OrderTicket());
                           if(SM_4_Mode_TS_Show_SL==true) {
                              string       linename_TS_2_Buy = StringConcatenate("OLEGs_EA_HLs_BO___TS_SL_Buy_", Time[i]);
//                     ObjectCreate(linename_TS_2_Buy, OBJ_TREND, 0,  Time[i+4],NormalizeDouble(Bid-SM_4_TS_Fixed*PointX,Digits),  Time[i],NormalizeDouble(Bid-SM_4_TS_Fixed*PointX,Digits) );
                              ObjectCreate(linename_TS_2_Buy, OBJ_TREND, 0,  Time[i+4],NormalizeDouble(OrderStopLoss()+SM_4_TS_Fixed*PointX,Digits),  Time[i],NormalizeDouble(OrderStopLoss()+SM_4_TS_Fixed*PointX,Digits) );
                              ObjectSet(   linename_TS_2_Buy, OBJPROP_STYLE, STYLE_SOLID);
                              ObjectSet(   linename_TS_2_Buy, OBJPROP_RAY,   False);
                              ObjectSet(   linename_TS_2_Buy, OBJPROP_WIDTH, 4);
                              ObjectSet(   linename_TS_2_Buy, OBJPROP_BACK, True);
                              ObjectSet(   linename_TS_2_Buy, OBJPROP_COLOR, DarkSlateBlue);
                           } // if(SM_4_Mode_TS_Show_SL==true) {
                           return(0);
                        }
                        if(Ans_TS_2_Buy==false) {
                           Alert (Symbol()+": ----------- Error - TS for BUY.   Ticket: #"+OrderTicket());
                        }
//               if(Fun_Error(GetLastError())==1) {                                     // Обработка ошибок
//                  continue;                                                           // Повторная попытка
//               }
                     } // if(OrderType() == OP_BUY  &&  OrderSymbol()==Symbol() )
                  }
// EO BUY -----------------------------------------------------------------------------------------
// SELL -----------------------------------------------------------------------------------------
                  if(OrderType()==OP_SELL) {
                     bool cond2_TS_BE_Sell = false;
//            if(SM_4_Mode_TS_On_BE_Only==true   &&   OrderStopLoss()<=OrderOpenPrice()) {
                     if(SM_4_Mode_TS_On_BE_Only==true   &&   ( (SM_4_Mode_TS_On_BE_Only_Once==false && OrderStopLoss()<=OrderOpenPrice()) || (SM_4_Mode_TS_On_BE_Only_Once==true && OrderStopLoss()==OrderOpenPrice()) ) ) {
                        cond2_TS_BE_Sell   = true;
                     }
                     if(SM_4_Mode_TS_On_BE_Only==false) {
                        cond2_TS_BE_Sell   = true;
                     }
                     double TS_2_Sell = (SM_4_TS_Fixed+SM_4_TS_Step)*PointX;
                     if(IsTradeAllowed()==false    &&    cond2_TS_BE_Sell==true   &&   Ask<=(OrderStopLoss()-TS_2_Sell) ) {
                        Alert(Symbol()+": ----------- Error - SELL: Торговый поток занят! Нельзя закрыть часть позиции! Ждем!   Ticket: #"+OrderTicket());
                        Sleep(100);
                     }
                     RefreshRates();
                     if(IsTradeAllowed()==true     &&    cond2_TS_BE_Sell==true   &&   Ask<=(OrderStopLoss()-TS_2_Sell) ) {
//               bool Ans_TS_2_Sell = OrderModify(OrderTicket(),OrderOpenPrice(), NormalizeDouble(Ask+SM_4_TS_Fixed*PointX,Digits), OrderTakeProfit(), 0,Red);
                        bool Ans_TS_2_Sell = OrderModify(OrderTicket(),OrderOpenPrice(), NormalizeDouble(OrderStopLoss()-SM_4_TS_Fixed*PointX,Digits), OrderTakeProfit(), 0,Red);
                        Sleep(3000);
                        if(Ans_TS_2_Sell == true) {
                           ObjectSet(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0), OBJPROP_PRICE1, NormalizeDouble(OrderStopLoss()-SM_4_TS_Fixed*PointX,Digits) ) ;
                           Alert (Symbol()+": TS SELL Succeeded. New SL = ", NormalizeDouble(Ask+SM_4_TS_Fixed*PointX,Digits), "   Ticket: #"+OrderTicket());
                           if(SM_4_Mode_TS_Show_SL==true) {
                              string       linename_TS_2_Sell = StringConcatenate("OLEGs_EA_HLs_BO___TS_SL_Sell_", Time[i]);
//                     ObjectCreate(linename_TS_2_Sell, OBJ_TREND, 0,  Time[i+4],NormalizeDouble(Ask+SM_4_TS_Fixed*PointX,Digits),  Time[i],NormalizeDouble(Ask+SM_4_TS_Fixed*PointX,Digits) );
                              ObjectCreate(linename_TS_2_Sell, OBJ_TREND, 0,  Time[i+4],NormalizeDouble(OrderStopLoss()-SM_4_TS_Fixed*PointX,Digits),  Time[i],NormalizeDouble(OrderStopLoss()-SM_4_TS_Fixed*PointX,Digits) );
                              ObjectSet(   linename_TS_2_Sell, OBJPROP_STYLE, STYLE_SOLID);
                              ObjectSet(   linename_TS_2_Sell, OBJPROP_RAY,   False);
                              ObjectSet(   linename_TS_2_Sell, OBJPROP_WIDTH, 4);
                              ObjectSet(   linename_TS_2_Sell, OBJPROP_BACK, True);
                              ObjectSet(   linename_TS_2_Sell, OBJPROP_COLOR, DarkSlateBlue);
                           } // if(SM_4_Mode_TS_Show_SL==true) {
                           return(0);
                        }
                        if(Ans_TS_2_Sell==false) {
                           Alert (Symbol()+": ----------- Error - TS for SELL.   Ticket: #"+OrderTicket());
                        }
//               if(Fun_Error(GetLastError())==1) {                                     // Обработка ошибок
//                  continue;                                                           // Повторная попытка
//               }
                     } // if(OrderType() == OP_SELL  &&  OrderSymbol()==Symbol() )
                  }
// EO SELL -----------------------------------------------------------------------------------------
               }
// EO MOVE SL TO TS TRAILING
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ```````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
// TIME BASED REAL_ORDER CLOSE AFTER XXX BARS IF PROFIT LESS THEN YYY PIPS
               if(SM_5_Mode_TimeBased_OC==true   &&   OrderCloseTime()==0 ) {
// ```````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ORDER BUY REAL DELETE ---
                  if(iBarShift(NULL,0,OrderOpenTime())>SM_5__Max_Bars_TimeBased_OC   &&   (Bid-OrderOpenPrice())<SM_5__Profit_TB_OC_PIPS*PointX   &&   OrderType()==OP_BUY   &&   OrderSymbol()==Symbol()   &&   OrderCloseTime()==0   &&   OrderMagicNumber()==My_Magic_Number ) {
                     if(IsTradeAllowed()==false ) {
                        Alert(Symbol()+": ----------- Error - BUY REAL TIME_BASED Delete: Торговый поток занят!   Ticket: #"+OrderTicket());
                        Sleep(100);
                     }
                     RefreshRates();
                     if( IsTradeAllowed()==true ) {
                        bool Buy_REAL_TB_Delete  = OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid,Digits), Slippage, Black);
                        Sleep(3000);
                        if(Buy_REAL_TB_Delete==true) {
                           Alert(Symbol(), ": Successfully Deleted Order BUY REAL TIME_BASED ", OrderTicket());
                           break;
                        }
                        if(FUNCTION_ERROR_REPORT(GetLastError())==1) {                              // Обработка ошибок
                           Alert(Symbol(), ": ----------- Error - BUY REAL TIME_BASED: Could Not Delete Order BUY REAL", OrderTicket());
                           continue;                                                    // Повторная попытка
                        }
                     }
                  } // if(iBarShift(NULL,0,OrderOpenTime())>SM_5__Max_Bars_TimeBased_OC
// EO ORDER BUY REAL DELETE ---
// ```````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ```````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ORDER SELL REAL DELETE ---
                  if(iBarShift(NULL,0,OrderOpenTime())>SM_5__Max_Bars_TimeBased_OC   &&   (OrderOpenPrice()-Ask)<SM_5__Profit_TB_OC_PIPS*PointX   &&   OrderType()==OP_SELL   &&   OrderSymbol()==Symbol()   &&   OrderCloseTime()==0   &&   OrderMagicNumber()==My_Magic_Number ) {
                     if(IsTradeAllowed()==false ) {
                        Alert(Symbol()+": ----------- Error - SELL REAL TIME_BASED Delete: Торговый поток занят!   Ticket: #"+OrderTicket());
                        Sleep(100);
                     }
                     RefreshRates();
                     if( IsTradeAllowed()==true ) {
                        bool Sell_REAL_TB_Delete = OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask,Digits), Slippage, Black);
                        Sleep(3000);
                        if(Sell_REAL_TB_Delete==true) {
                           Alert(Symbol(), ": Successfully Deleted Order SELL REAL TIME_BASED ", OrderTicket());
                           break;
                        }
                        if(FUNCTION_ERROR_REPORT(GetLastError())==1) {                              // Обработка ошибок
                           Alert(Symbol(), ": ----------- Error - SELL REAL TIME_BASED: Could Not Delete Order SELL REAL", OrderTicket());
                           continue;                                                    // Повторная попытка
                        }
                     }
                  } // if(iBarShift(NULL,0,OrderOpenTime())>SM_5__Max_Bars_TimeBased_OC
// EO ORDER SELL REAL DELETE ---
// ```````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
               } // if(SM_5_Mode_TimeBased_OC==true   &&   OrdersTotal()>0   &&   OrderSymbol()==Symbol()   &&   OrderCloseTime()==0   &&   OrderMagicNumber()==My_Magic_Number ) {
// EO TIME BASED CLOSE AFTER XXX BARS IF PROFIT LESS THEN YYY PIPS
// ```````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
            } // if(OrderSymbol()==Symbol()   &&   OrderMagicNumber()==My_Magic_Number) {
         } // if(OrderSelect(cnt_12, SELECT_BY_POS, MODE_TRADES)==true) {
      } // for(int cnt_12=OrdersTotal()-1; cnt_12>=0; cnt_12--) {
   } // if(OrdersTotal()>0) {
// ### ##########################################################################################################
   if(SM_9_Mode_Show_Info_On_Screen==true) {
      FUNCTION_SHOW_INFO_ON_SCREEN();
   }
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
// TEST MODE - SHOWS STATISTICS
   if(Mode_TEST_DEINIT_Only==false) {
//       FUNCTION_TEST_MODE(bool Mode_TEST_Comments, bool Mode_TEST_TABLE, bool Mode_Deinit)
      FUNCTION_TEST_MODE(true, false, false);
   }
// EO TEST MODE - SHOWS STATISTICS
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if(Mode_TEST==true) {
//         if(Mode_TEST_Comments==true) {
      Comment(
//               "\n",
//               "\n", "SPREAD                       = ", (Ask-Bid)/PointX,
         "\n", "Account__________[$]        = ", MathMin(MathRound(AccountBalance()), MathRound(AccountEquity())),
         "\n", "Total_Profit                            = ", MathRound(AccountBalance()-Account_Balance_INIT), " [$] <> ", Max_Total_Profit_PIPS, " [Pips]",
         "\n", "Average_Profit_____[$]        = ", MathRound(Aver_Profit_In_Profitable),
         "\n", "Average_Loss______[$]        = ", MathRound(Aver_Loss_In_Losing),
         "\n", "Max In_Row Trades BE          = ", Max_Trades_BE,
         "\n", "Max In_Row Trades Profitable = ", Max_Trades_Profitable,
         "\n", "Max In_Row Trades Losing     = ", Max_Trades_Losing,
         "\n", "Total Trades BE                      = ", counter_Total_Trades_BE, " (", Percent_BreakEven, " %)",
         "\n", "Total Trades Profitable            = ", counter_Total_Trades_Profitable, " (", Percent_Profitable, " %)",
         "\n", "Total Trades Losing                = ", counter_Total_Trades_Losing, " (", Percent_Losing, " %)",
         "\n", "Total_Trades [REAL]              = ", counter_Total_Trades,
//               "\n", "=======================        ",
         "\n", "MaxEquity __________[$]    = ", MaxEquity,
//               "\n", "Equity__Current______[$]   = ", Equity_Current,
//               "\n", "Balance_Current______[$]    = ", Balance_Current,
         "\n", "Equity__Current______[$]   = ", NormalizeDouble(AccountEquity(),1),
         "\n", "Balance_Current______[$]    = ", NormalizeDouble(AccountBalance(),1),
         "\n", "Local_Drawdown_____[%]   = ", NormalizeDouble(Local_DD_X,2),
         "\n", "Relative_Drawdown___[%]   = ", NormalizeDouble(Relative_Drawdown,2),
//               "\n", "AccountProfit()_______[$]   = ", AccountProfit(),
         "\n"
      );
//         } // if(Mode_TEST_Comments==true) {
   }
   if(Mode_TEST==false) {
      Comment(
         "\n",
         "\n", "SPREAD                       = ", (Ask-Bid)/PointX,
         "\n", "=======================        ",
         "\n", "MaxEquity __________[$]    = ", MaxEquity,
         "\n", "Equity__Current______[$]   = ", Equity_Current,
         "\n", "Balance_Current______[$]    = ", Balance_Current,
         "\n", "Equity__Current______[$]   = ", NormalizeDouble(AccountEquity(),1),
         "\n", "Balance_Current______[$]    = ", NormalizeDouble(AccountBalance(),1),
         "\n", "Local_Drawdown_____[%]   = ", NormalizeDouble(Local_DD_X,2),
         "\n", "Relative_Drawdown___[%]   = ", NormalizeDouble(Relative_Drawdown,2),
         "\n", "AccountProfit()_______[$]   = ", AccountProfit(),
         "\n"
      );
   }
   if(GlobalVariableGet("_GV_SIMAN_CREATE_ARR_IMMEDIATELY")==1) {
      GlobalVariableSet("_GV_SIMAN_CREATE_ARR_IMMEDIATELY", 0);        // If '1' => run creation of array
      FUNCTION_CREATE_ARRAY_REAL();
      FUNCTION_SAVE_ARRAY2FILE(Array_CLSD_TimeOpen);
   }
   /*
         Comment(
         "\n",
         "\n",
         "\n", "AccountEquity()                 = ", AccountEquity(),
         "\n", "AccountBalance()                = ", AccountBalance(),
         "\n",
         "\n",
   //      "\n", "Status_tmp                 = ", Status_tmp,
         "\n",
         "\n" );
   */
//Print("Баланс счета [$] = ", AccountBalance());
//Print("Прибыль      [$] = ", AccountProfit());
//Print("Эквити       [$] = ", AccountEquity());
   return(0);                                                                      // Выход из start()
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
} // int start() {
// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++














// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
int FUNCTION_ERROR_REPORT(int Error) {                                                                // Ф-ия обработ ошибок
   switch(Error) {                                                                        // Преодолимые ошибки
   case  4:
      Alert(Symbol()+": --------- Error - Торговый сервер занят. Пробуем ещё раз..");
      Sleep(3000);                                                                     // Простое решение
      return(1);                                                                       // Выход из функции
   case 128:
      Alert(Symbol()+": --------- Error - TIMEOUT (possible disconnection) - Истек срок ожидания совершения сделки. Пробуем ещё..");
      Sleep(2000);                                                                     // Простое решение
      return(1);                                                                       // Выход из функции
   case 135:
      Alert(Symbol()+": --------- Error - Цена изменилась. Пробуем ещё раз..");
      RefreshRates();                                                                  // Обновим данные
      return(1);                                                                       // Выход из функции
   case 136:
      Alert(Symbol()+": --------- Error - Нет цен. Ждём новый тик..");
      while(RefreshRates()==false)                                                     // До нового тика
         Sleep(1);                                                                     // Задержка в цикле
      return(1);                                                                       // Выход из функции
   case 137:
      Alert(Symbol()+": --------- Error - Брокер занят. Пробуем ещё раз..");
      Sleep(3000);                                                                     // Простое решение
      return(1);                                                                       // Выход из функции
   case 146:
      Alert(Symbol()+": --------- Error - Подсистема торговли занята. Пробуем ещё..");
      Sleep(500);                                                                      // Простое решение
      return(1);                                                                       // Выход из функции
   case 138:
      Alert(Symbol()+": --------- Error - REQUOTE..");
      Sleep(3000);                                                                     // Простое решение
      return(1);                                                                       // Выход из функции
   case 6:
      Alert(Symbol()+": --------- Error - No connection with Trade Server..");
      Sleep(1000);                                                                     // Простое решение
      return(1);                                                                       // Выход из функции
// -------------   Критические ошибки   ---------------------------------
   case  2:
      Alert(Symbol()+": --------- Error - Общая ошибка.");
      return(0);                                                                       // Выход из функции
   case  3:
      Alert(Symbol()+": --------- Error - Invalid trade parameters.");
      return(0);                                                                       // Выход из функции
//      case  5: Alert(Symbol()+": --------- Error - Старая версия терминала. ===>>> RunExpert = FALSE!!!!!!!!!!");
//         RunExpert = false;                                                            // Больше не работать
//         return;                                                                       // Выход из функции
   case  8:
      Alert(Symbol()+": --------- Error - Частые запросы.");
      return(0);                                                                       // Выход из функции
//      case 64: Alert(Symbol()+": --------- Error - Счет заблокирован. ===>>> RunExpert = FALSE!!!!!!!!!!");
//         RunExpert = false;                                                            // Больше не работать
//         return;                                                                       // Выход из функции
   case 130:
      Alert(Symbol()+": --------- Error - Неверные Стопы или Размер Лота, или ЗАПРЕЩЕНО открывать Ордер одновременно со SL и/или TP!!!");
      return(0);                                                                       // Выход из функции
   case 131:
      Alert(Symbol()+": --------- Error - Неверно рассчитывается объем сделки.");
      return(0);                                                                       // Выход из функции
   case 133:
      Alert(Symbol()+": --------- Error - Торговля запрещена.");
      return(0);                                                                       // Выход из функции
   case 134:
      Alert(Symbol()+": --------- Error - Недостаточно денег для совершения операции.");
      return(0);                                                                       // Выход из функции
   default:
      Alert(Symbol()+": --------- Error - Возникла ошибка ",Error);                                // Другие варианты
      return(0);                                                                       // Выход из функции
   }
}
// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++








// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
void FUNCTION_DRAW_NEW_TLINE(datetime Time_Left, datetime Time_Right, double TLINE_Value, string Line_Name, color TLINE_Color) {
   if(ObjectFind(Line_Name)==-1) {
      string       MyLine_Set_TLINE = Line_Name;
      ObjectCreate(MyLine_Set_TLINE, OBJ_TREND,  0,  Time_Left,TLINE_Value,  Time_Right,TLINE_Value);
      ObjectSet(   MyLine_Set_TLINE, OBJPROP_STYLE, STYLE_SOLID);
      ObjectSet(   MyLine_Set_TLINE, OBJPROP_RAY,   False);
      ObjectSet(   MyLine_Set_TLINE, OBJPROP_WIDTH, 3);
      ObjectSet(   MyLine_Set_TLINE, OBJPROP_BACK, True);
      ObjectSet(   MyLine_Set_TLINE, OBJPROP_COLOR, TLINE_Color);
      //ObjectSetText(MyLine_Set_TLINE, "x", 10, "Arial", TLINE_Color);
      //string text = ObjectGetString(0, MyLine_Set_TLINE, OBJPROP_TEXT);
      //Print("text = ", text);
      WindowRedraw();
   }
}
// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++







// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
void FUNCTION_CALCULATE_SL() {
   if(SM_2__SL_Fixed<SM_8_Hard_Limit_MIN_SL) {
      Alert(Symbol()+": --------- WARNING_err ->  SM_2__SL_Fixed ", SM_2__SL_Fixed, " is less than   SM_8_Hard_Limit_MIN_SL=", SM_8_Hard_Limit_MIN_SL, " ===>>> [SM_8_Hard_Limit_MIN_SL] Will be used!");
      SM_2__SL_Fixed = SM_8_Hard_Limit_MIN_SL;
   }
// SL_MODE ATR
   if(SM_2__Mode_SL==0   &&   PointX>0.0) {
      ATR_Value_0    = iATR(Symbol(), PERIOD_D1, SM_2___SL__ADR_Period, 1);
      SL_REAL        = MathRound((SM_2___SL__ADR_Multiplier*ATR_Value_0) / PointX);
      if(SL_REAL<SM_2__SL_Fixed) {
         Alert(Symbol()+": --------- WARNING_err ->  SL_ATR:: SL_REAL = ", SL_REAL, " is less than   SM_2__SL_Fixed = ", SM_2__SL_Fixed," ! It will be AUTOMATICALLY increased to SM_2__SL_Fixed = ", SM_2__SL_Fixed);
         SL_REAL     = SM_2__SL_Fixed;
      }
   }
// SL_MODE FIXED
   if(SM_2__Mode_SL==1) {
      SL_REAL        = SM_2__SL_Fixed;
   }
}
// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++










// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
void FUNCTION_MM_CHECKS_BUY() {
   if(SM_6_Mode_MM==false) {
      SM_6__Order_Lots_Real                       = SM_6__Order_Lots;
   }
   if(SM_6_Mode_MM==true) {
      SM_6__Order_Lots_Real                       = FUNCTION_LOTSIZE_CALC(SL_REAL);
      SM_6__Order_Lots_Real                       = FUNCTION_ROUNDING_OPEN_LOTS(SM_6__Order_Lots_Real);
      if(AccountFreeMarginCheck(Symbol(), OP_BUY, SM_6__Order_Lots_Real)<0.0) {
         Alert(Symbol()+": --------- Error Buy -> We have no money. Free Margin = ", AccountFreeMargin());
         return;
      }
   } // if(SM_6_Mode_MM==true) {
   if(SM_6__Order_Lots_Real<Hard_Limit_MIN_Lots ) {
      Alert(Symbol()+": --------- Error Buy -> Not Enough money (", MoneyAvailable, ") for ", SM_6__Order_Lots_Real, " lots!  Minimal LOT is ", Hard_Limit_MIN_Lots, " . Skipping Trade!");
      return;
   }
   if(SM_6__Order_Lots_Real>Hard_Limit_MAX_Lots ) {
      Alert(Symbol(), ": Buy:  SM_6__Order_Lots_Real=", SM_6__Order_Lots_Real, " is bigger than Hard_Limit_MAX_Lots =>>> SM_6__Order_Lots_Real = ", Hard_Limit_MAX_Lots, " will be used!");
      SM_6__Order_Lots_Real = Hard_Limit_MAX_Lots;
   }
}
// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++







// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
void FUNCTION_MM_CHECKS_SELL() {
   if(SM_6_Mode_MM==false) {
      SM_6__Order_Lots_Real                       = SM_6__Order_Lots;
   }
   if(SM_6_Mode_MM==true) {
      SM_6__Order_Lots_Real                       = FUNCTION_LOTSIZE_CALC(SL_REAL);
      SM_6__Order_Lots_Real                       = FUNCTION_ROUNDING_OPEN_LOTS(SM_6__Order_Lots_Real);
      if(AccountFreeMarginCheck(Symbol(), OP_SELL, SM_6__Order_Lots_Real)<0.0) {
         Alert(Symbol()+": --------- Error Sell -> We have no money. Free Margin = ", AccountFreeMargin());
         return;
      }
   } // if(SM_6_Mode_MM==true) {
   if(SM_6__Order_Lots_Real<Hard_Limit_MIN_Lots ) {
      Alert(Symbol()+": --------- Error Sell -> Not Enough money (", MoneyAvailable, ") for ", SM_6__Order_Lots_Real, " lots!  Minimal LOT is ", Hard_Limit_MIN_Lots, " . Skipping Trade!");
      return;
   }
   if(SM_6__Order_Lots_Real>Hard_Limit_MAX_Lots ) {
      Alert(Symbol(), ": Sell:  SM_6__Order_Lots_Real=", SM_6__Order_Lots_Real, " is bigger than Hard_Limit_MAX_Lots =>>> SM_6__Order_Lots_Real = ", Hard_Limit_MAX_Lots, " will be used!");
      SM_6__Order_Lots_Real = Hard_Limit_MAX_Lots;
   }
}
// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++







// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Order_Type: OP_BUY, OP_BUYLIMIT, OP_BUYSTOP

// OP_BUY       0 Покупка
// OP_SELL      1 Продажа
// OP_BUYLIMIT  2 Отложенный ордер BUY LIMIT
// OP_SELLLIMIT 3 Отложенный ордер SELL LIMIT
// OP_BUYSTOP   4 Отложенный ордер BUY STOP
// OP_SELLSTOP  5 Отложенный ордер SELL STOP

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void FUNCTION_OPEN_ORDER_BUY(double Order_Open_Price, int Order_Type) {
   if(Mode_Order_Confirm!="< ON >") {
      return;
   }
   while(true) {
      if(IsTradeAllowed()==false) {
         Alert(Symbol()+": ----------- Something Wrong - BUY: Торговый поток занят! Эксперт не может открыть позицию! Ждем!");
         Sleep(100);
      }
      if(IsTradeAllowed()==true) {
         RefreshRates();
         double SL               = NormalizeDouble(Order_Open_Price-SL_REAL*PointX,Digits);
         double TP               = NormalizeDouble(Order_Open_Price+TP_REAL*PointX,Digits);
         int TicketBuyReal       = OrderSend(Symbol(), Order_Type, SM_6__Order_Lots_Real, NormalizeDouble(Order_Open_Price,Digits), Slippage, SL, TP, "MyOrder_Buy",My_Magic_Number,0,Green );
         Sleep(3000);
         if(TicketBuyReal>0) {                                    // Получилось :)
            if(ObjectFind(MyLine_Set_Stop_Buy)!=-1      &&   MathMin(ObjectGet(MyLine_Set_Stop_Buy,OBJPROP_TIME1),ObjectGet(MyLine_Set_Stop_Buy,OBJPROP_TIME2))<=Time[0] ) {
               ObjectDelete(MyLine_Set_Stop_Buy);
               ObjectDelete("Label_Switch");
            }
            if(ObjectFind(MyLine_Set_Limit_Buy)!=-1     &&   MathMin(ObjectGet(MyLine_Set_Limit_Buy,OBJPROP_TIME1),ObjectGet(MyLine_Set_Limit_Buy,OBJPROP_TIME2))<=Time[0] ) {
               ObjectDelete(MyLine_Set_Limit_Buy);
               ObjectDelete("Label_Switch");
            }
            if(ObjectFind(MyLine_Set_SL)!=-1            &&   MathMin(ObjectGet(MyLine_Set_SL,OBJPROP_TIME1),ObjectGet(MyLine_Set_SL,OBJPROP_TIME2))<=Time[0] ) {
               ObjectDelete(MyLine_Set_SL);
               ObjectDelete("Label_Switch");
            }
//                  FUNCTION_DRAW_HLINE_OP_TP_SL(Order_Open_Price, TP, SL, Order_Type, TicketBuyReal);
            if(SM__10_Make_TESTER_Template==true) {
               if(Order_Type==OP_BUYSTOP ) {
                  string       Rect_Buy   = "MyLine_RECT_Buy_"+Time[0];
                  ObjectCreate(Rect_Buy, OBJ_RECTANGLE, 0,  Time[0],High[1]+Threshold_Buy*PointX,  Time[0]-Period()*4*60,High[1]-30*PointX);
                  ObjectSet(   Rect_Buy, OBJPROP_STYLE, STYLE_SOLID);
                  ObjectSet(   Rect_Buy, OBJPROP_RAY, False);
                  ObjectSet(   Rect_Buy, OBJPROP_WIDTH, 1);
                  ObjectSet(   Rect_Buy, OBJPROP_BACK, True);
                  ObjectSet(   Rect_Buy, OBJPROP_COLOR, Color_Buy);
               }
            } // if(SM__10_Make_TESTER_Template==true) {
            string Order_Type_s  = "";
            if(Order_Type==0) {
               Order_Type_s      = "OP_BUY";
            }
            if(Order_Type==2) {
               Order_Type_s      = "OP_BUYLIMIT";
            }
            if(Order_Type==4) {
               Order_Type_s      = "OP_BUYSTOP";
            }
//                  Alert(Symbol()+": Successfully Opened Order BUY : Open_Buy=", NormalizeDouble(Order_Open_Price,Digits), "   SL=", SL, "   TP=", TP, "   Lots=", SM_6__Order_Lots_Real, "   #", TicketBuyReal );
            Alert(Symbol()+": Successfully Opened Order BUY: ", Order_Type_s, "=", NormalizeDouble(Order_Open_Price,Digits), "   SL=", SL, "   TP=", TP, "   Lots=", SM_6__Order_Lots_Real, "   #", TicketBuyReal );
            return;
         }
         if(TicketBuyReal<0) {
            string Order_Type_s  = "";
            if(Order_Type==0) {
               Order_Type_s      = "OP_BUY";
            }
            if(Order_Type==2) {
               Order_Type_s      = "OP_BUYLIMIT";
            }
            if(Order_Type==4) {
               Order_Type_s      = "OP_BUYSTOP";
            }
//                  Alert(Symbol()+": ----------- Something Wrong - Open Buy REAL: Open_Buy=", NormalizeDouble(Order_Open_Price,Digits), "   SL=", SL, "   TP=", TP, "   Lots=", SM_6__Order_Lots_Real );
            Alert(Symbol()+": ----------- Something Wrong - Open BUY: ", Order_Type_s, "=", NormalizeDouble(Order_Open_Price,Digits), "   SL=", SL, "   TP=", TP, "   Lots=", SM_6__Order_Lots_Real );
         }
         if(FUNCTION_ERROR_REPORT(GetLastError())==1) {                       // Обработка ошибок
            continue;                                             // Повторная попытка
         }
         return;                                                  // Выход из start()
      } // if(OrderBuyExists==false   &&   OPEN_BUY_REAL==true ) {
      break;                                                            // Выход из while
   } // while(true) {
}
// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++





// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Order_Type: OP_SELL, OP_SELLLIMIT, OP_SELLSTOP

// OP_BUY       0 Покупка
// OP_SELL      1 Продажа
// OP_BUYLIMIT  2 Отложенный ордер BUY LIMIT
// OP_SELLLIMIT 3 Отложенный ордер SELL LIMIT
// OP_BUYSTOP   4 Отложенный ордер BUY STOP
// OP_SELLSTOP  5 Отложенный ордер SELL STOP

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void FUNCTION_OPEN_ORDER_SELL(double Order_Open_Price, int Order_Type) {
   if(Mode_Order_Confirm!="< ON >") {
      return;
   }
   while(true) {
      if(IsTradeAllowed()==false) {
         Alert(Symbol()+": ----------- Something Wrong - SELL: Торговый поток занят! Эксперт не может открыть позицию! Ждем!");
         Sleep(100);
      }
      if(IsTradeAllowed()==true) {
         RefreshRates();
         double SL               = NormalizeDouble(Order_Open_Price+SL_REAL*PointX,Digits);
         double TP               = NormalizeDouble(Order_Open_Price-TP_REAL*PointX,Digits);
         int TicketSellReal      = OrderSend(Symbol(), Order_Type, SM_6__Order_Lots_Real, NormalizeDouble(Order_Open_Price,Digits), Slippage, SL, TP, "MyOrder_Sell",My_Magic_Number,0,Red );
         Sleep(3000);
         if(TicketSellReal>0) {                                   // Получилось :)
            if(ObjectFind(MyLine_Set_Stop_Sell)!=-1      &&   MathMin(ObjectGet(MyLine_Set_Stop_Sell,OBJPROP_TIME1),ObjectGet(MyLine_Set_Stop_Sell,OBJPROP_TIME2))<=Time[0] ) {
               ObjectDelete(MyLine_Set_Stop_Sell);
               ObjectDelete("Label_Switch");
            }
            if(ObjectFind(MyLine_Set_Limit_Sell)!=-1     &&   MathMin(ObjectGet(MyLine_Set_Limit_Sell,OBJPROP_TIME1),ObjectGet(MyLine_Set_Limit_Sell,OBJPROP_TIME2))<=Time[0] ) {
               ObjectDelete(MyLine_Set_Limit_Sell);
               ObjectDelete("Label_Switch");
            }
            if(ObjectFind(MyLine_Set_SL)!=-1             &&   MathMin(ObjectGet(MyLine_Set_SL,OBJPROP_TIME1),ObjectGet(MyLine_Set_SL,OBJPROP_TIME2))<=Time[0] ) {
               ObjectDelete(MyLine_Set_SL);
               ObjectDelete("Label_Switch");
            }
//                  FUNCTION_DRAW_HLINE_OP_TP_SL(Order_Open_Price, TP, SL, Order_Type, TicketSellReal);
            if(SM__10_Make_TESTER_Template==true) {
               if(Order_Type==OP_SELLSTOP ) {
                  string       Rect_Sell  = "MyLine_RECT_Sell_"+Time[0];
                  ObjectCreate(Rect_Sell, OBJ_RECTANGLE, 0,  Time[0],Low[1]-Threshold_Sell*PointX,  Time[0]-Period()*4*60,Low[1]+30*PointX);
                  ObjectSet(   Rect_Sell, OBJPROP_STYLE, STYLE_SOLID);
                  ObjectSet(   Rect_Sell, OBJPROP_RAY, False);
                  ObjectSet(   Rect_Sell, OBJPROP_WIDTH, 1);
                  ObjectSet(   Rect_Sell, OBJPROP_BACK, True);
                  ObjectSet(   Rect_Sell, OBJPROP_COLOR, Color_Sell);
               }
            } // if(SM__10_Make_TESTER_Template==true) {
            string Order_Type_s  = "";
            if(Order_Type==1) {
               Order_Type_s      = "OP_SELL";
            }
            if(Order_Type==3) {
               Order_Type_s      = "OP_SELLLIMIT";
            }
            if(Order_Type==5) {
               Order_Type_s      = "OP_SELLSTOP";
            }
//                  Alert(Symbol()+": Successfully Opened Order SELL : Open_Sell=", NormalizeDouble(Order_Open_Price,Digits), "   SL=", SL, "   TP=", TP, "   Lots=", SM_6__Order_Lots_Real, "   #", TicketSellReal );
            Alert(Symbol()+": Successfully Opened Order SELL: ", Order_Type_s, "=", NormalizeDouble(Order_Open_Price,Digits), "   SL=", SL, "   TP=", TP, "   Lots=", SM_6__Order_Lots_Real, "   #", TicketSellReal );
            return;
         }
         if(TicketSellReal<0) {
            string Order_Type_s  = "";
            if(Order_Type==1) {
               Order_Type_s      = "OP_SELL";
            }
            if(Order_Type==3) {
               Order_Type_s      = "OP_SELLLIMIT";
            }
            if(Order_Type==5) {
               Order_Type_s      = "OP_SELLSTOP";
            }
//                  Alert(Symbol()+": ----------- Something Wrong - Open Sell REAL: Open_Sell=", NormalizeDouble(Order_Open_Price,Digits), "   SL=", SL, "   TP=", TP, "   Lots=", SM_6__Order_Lots_Real );
            Alert(Symbol()+": ----------- Something Wrong - Open SELL: ", Order_Type_s, "=", NormalizeDouble(Order_Open_Price,Digits), "   SL=", SL, "   TP=", TP, "   Lots=", SM_6__Order_Lots_Real );
         }
         if(FUNCTION_ERROR_REPORT(GetLastError())==1) {                       // Обработка ошибок
            continue;                                             // Повторная попытка
         }
         return;                                                  // Выход из start()
      } // if(OrderSellExists==false   &&   OPEN_SELL_REAL==true ) {
      break;                                                            // Выход из while
   } // while(true) {
}
// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++








// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
double FUNCTION_LOTSIZE_CALC(double StopLoss) {
   /*
      double LotVal = MarketInfo(Symbol(),MODE_TICKVALUE);          //стоимость 1 пункта 1 лота

   // ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
   //   double PointX = 0;
      if(Digits==5 || Digits==3) {
         LotVal = LotVal * 10;
      }
      if(Digits==4 || Digits==2) {
         LotVal = LotVal;
      }
   // ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
   */
//   MoneyAvailable        = MathMin(MathMin(AccountBalance(),AccountFreeMargin()), AccountEquity()) / 1.2;
   MoneyAvailable        = MathMin(MathMin(AccountBalance(),AccountFreeMargin()), AccountEquity());
   double Min_Lot        = MathMax(Hard_Limit_MIN_Lots, MarketInfo(Symbol(),MODE_MINLOT));
   double Max_Lot        = MathMin(Hard_Limit_MAX_Lots, MarketInfo(Symbol(),MODE_MAXLOT));
   double Step           = MarketInfo(Symbol(),MODE_LOTSTEP);
   double Lot            = MathFloor(  (MoneyAvailable*SM_6__MM_Risk_Percent/100.0) / (StopLoss*LotVal) / MarketInfo(Symbol(),MODE_LOTSTEP)  ) * MarketInfo(Symbol(),MODE_LOTSTEP);
   if(Lot<Min_Lot) {
      Lot = Min_Lot;
   }
   if(Lot>Max_Lot) {
      Lot = Max_Lot;
   }
   return(Lot);
}
// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++












// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//=================================================================================
// Функция округления лотов перед открытием позиции до требуемых брокером.        |
//=================================================================================

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double FUNCTION_ROUNDING_OPEN_LOTS(double LotSize) {
   Hard_Limit_MIN_Lots    = MathMax(Hard_Limit_MIN_Lots,MarketInfo(Symbol(),MODE_MINLOT));
   double LotMin  = Hard_Limit_MIN_Lots;
   double LotStep = MarketInfo(Symbol(), MODE_LOTSTEP);
//   double Res;
//   Res =  LotSize*(100.0 - Close_Ratio*100)/100.0;    // Считаем сколько должно остаться
//   Res -= LotMin;                                                // Убираем миниальный лот
//   Res =  MathRound(Res/LotStep)*LotStep;                        // Округляем до заданой точности
//   Res += LotMin;                                                // Получаем размер позиции после закрытия
//   Res =  LotSize-Res;                                           // Считаем размер к закрытию
//   return(Res);
   LotSize -= LotMin;                                              // Убираем миниальный лот
//   LotSize =  MathRound(LotSize/LotStep)*LotStep;                // Округляем до заданой точности
   LotSize =  MathRound(LotSize/LotMin)*LotMin;                    // Округляем до заданой точности
   LotSize += LotMin;                                              // Получаем размер позиции после закрытия
   LotSize = MathAbs(LotSize);
   return(LotSize);
}
// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++











// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
void FUNCTION_DRAW_HLINE_OP_TP_SL(double Order_Open_Price, double TP_Price, double SL_Price, int Order_Type, int Order_Ticket) {
   string            Line_SL  = MyLine_HLINE_SL+DoubleToStr(Order_Ticket,0);
   ObjectCreate(     Line_SL, OBJ_HLINE, 0,  0, SL_Price );
   ObjectSet(        Line_SL, OBJPROP_STYLE, STYLE_DASHDOT);
   ObjectSet(        Line_SL, OBJPROP_WIDTH, 1);
   ObjectSet(        Line_SL, OBJPROP_BACK, False);
   ObjectSet(        Line_SL, OBJPROP_COLOR, Red);
   ObjectSetText(    Line_SL, "                         SL_"+FUNCTION_ORDER_TYPE_NUM2STR(Order_Type), 10, "Times New Roman", Red);
   string            Line_TP  = MyLine_HLINE_TP+DoubleToStr(Order_Ticket,0);
   ObjectCreate(     Line_TP, OBJ_HLINE, 0,  0, TP_Price );
   ObjectSet(        Line_TP, OBJPROP_STYLE, STYLE_DASHDOT);
   ObjectSet(        Line_TP, OBJPROP_WIDTH, 1);
   ObjectSet(        Line_TP, OBJPROP_BACK, False);
   ObjectSet(        Line_TP, OBJPROP_COLOR, Green);
   ObjectSetText(    Line_TP, "                         TP_"+FUNCTION_ORDER_TYPE_NUM2STR(Order_Type), 10, "Times New Roman", Green);
   string            Line_OP  = MyLine_HLINE_OP+DoubleToStr(Order_Ticket,0);
   ObjectCreate(     Line_OP, OBJ_HLINE, 0,  0, Order_Open_Price );
   ObjectSet(        Line_OP, OBJPROP_STYLE, STYLE_DASHDOT);
   ObjectSet(        Line_OP, OBJPROP_WIDTH, 1);
   ObjectSet(        Line_OP, OBJPROP_BACK, True);
   ObjectSet(        Line_OP, OBJPROP_COLOR, Blue);
   ObjectSetText(    Line_OP, "                         OP_"+FUNCTION_ORDER_TYPE_NUM2STR(Order_Type), 10, "Times New Roman", Blue);
   WindowRedraw();
}
// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++








// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
string FUNCTION_ORDER_TYPE_NUM2STR(int Order_Type) {
   string Order_Type_String = "";
   if(Order_Type==0) {
      Order_Type_String = "OP_BUY";
   }
   if(Order_Type==1) {
      Order_Type_String = "OP_SELL";
   }
   if(Order_Type==2) {
      Order_Type_String = "OP_BUYLIMIT";
   }
   if(Order_Type==3) {
      Order_Type_String = "OP_SELLLIMIT";
   }
   if(Order_Type==4) {
      Order_Type_String = "OP_BUYSTOP";
   }
   if(Order_Type==5) {
      Order_Type_String = "OP_SELLSTOP";
   }
   return(Order_Type_String);
}
// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++











// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// TEST_MODE - STATISTICS ACCUMULATION

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void FUNCTION_DRAW_TLINE(string Line_Name, datetime Time_1, double Price_1, datetime Time_2, double Price_2, color Line_Color) {
   string       MyLine_TLINE = StringConcatenate(Line_Name, "_", Time_1);
   ObjectCreate(MyLine_TLINE, OBJ_TREND, 0,  Time_1,Price_1,    Time_2,Price_2 );
   ObjectSet(   MyLine_TLINE, OBJPROP_STYLE, STYLE_SOLID);
   ObjectSet(   MyLine_TLINE, OBJPROP_RAY,   False);
   ObjectSet(   MyLine_TLINE, OBJPROP_WIDTH, 6);
   ObjectSet(   MyLine_TLINE, OBJPROP_BACK, True);
   ObjectSet(   MyLine_TLINE, OBJPROP_COLOR, Line_Color);
}

// TEST_MODE - STATISTICS ACCUMULATION
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++









//datetime        Array_TM_OrderTimeClose[];
//int             Array_TM_OrderTicket[];

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// TEST_MODE - SORT ARRAYS BY ORDERS TIME CLOSE

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void FUNCTION_TM_SORT_ARRAYS() {
   TM_Counter                                     = 0;
   for(int cnt_Symb_A=OrdersHistoryTotal()-1; cnt_Symb_A>=0; cnt_Symb_A--) {        // Fill Both Arrays by Data
      if(OrderSelect(cnt_Symb_A, SELECT_BY_POS, MODE_HISTORY)==true) {
         if(OrderSymbol()==Symbol()   &&   (OrderType()==OP_BUY   ||   OrderType()==OP_SELL)   &&   OrderCloseTime()!=0   &&   OrderMagicNumber()==My_Magic_Number ) {
            TM_Counter                            = TM_Counter + 1;
            ArrayResize(Array_TM_OrderTimeClose,    TM_Counter);
            ArrayResize(Array_TM_OrderTicket,       TM_Counter);
            Array_TM_OrderTimeClose[TM_Counter-1] = OrderCloseTime();
            Array_TM_OrderTicket[TM_Counter-1]    = OrderTicket();
         } // if(OrderSymbol()==Symbol()   &&   (OrderType()==OP_BUY   ||   OrderType()==OP_SELL)   &&   OrderCloseTime()!=0   &&   OrderMagicNumber()==My_Magic_Number ) {
      } // if(OrderSelect(cnt_Symb_A, SELECT_BY_TICKET)==true) {
   } // for(int cnt_Symb_A=0; cnt_Symb_A<OrdersHistoryTotal(); cnt_Symb_A++) {
//две временные переменных, которые потребуются при обмене значений сортируемых массивов
   datetime tmp_TimeArray;
   int      tmp_TicketArray;
   for(int k=0; k<ArraySize(Array_TM_OrderTimeClose); k++) {               //сортируем
      for(int j=0; j<ArraySize(Array_TM_OrderTimeClose); j++) {
//         if(Array_TM_OrderTimeClose[j]<Array_TM_OrderTimeClose[k]){      //для сортировки в обратном порядке поставить   ">"
         if(Array_TM_OrderTimeClose[j]>Array_TM_OrderTimeClose[k]) {       //для сортировки в обратном порядке поставить   ">"
            tmp_TimeArray                         = Array_TM_OrderTimeClose[j];
            tmp_TicketArray                       = Array_TM_OrderTicket[j];
            Array_TM_OrderTimeClose[j]            = Array_TM_OrderTimeClose[k];
            Array_TM_OrderTicket[j]               = Array_TM_OrderTicket[k];
            Array_TM_OrderTimeClose[k]            = tmp_TimeArray;
            Array_TM_OrderTicket[k]               = tmp_TicketArray;
         }
      } // for(int j=0; j<ArraySize(Array_TM_OrderTimeClose); j++){
   } // for(int k=0; k<ArraySize(Array_TM_OrderTimeClose); k++){
   /*
         Comment(
         "\n",
         "\n",
         "\n",
         "\n",
         "\n", "Array_TM_OrderTicket[0] = ", Array_TM_OrderTicket[0],
         "\n", "Array_TM_OrderTicket[1] = ", Array_TM_OrderTicket[1],
         "\n", "Array_TM_OrderTicket[2] = ", Array_TM_OrderTicket[2],
         "\n", "Array_TM_OrderTicket[3] = ", Array_TM_OrderTicket[3],
         "\n", "Array_TM_OrderTicket[4] = ", Array_TM_OrderTicket[4],
         "\n", "Array_TM_OrderTicket[5] = ", Array_TM_OrderTicket[5],

         "\n", "Array_TM_OrderTicket[6] = ", Array_TM_OrderTicket[6],
         "\n", "Array_TM_OrderTicket[7] = ", Array_TM_OrderTicket[7],
         "\n", "Array_TM_OrderTicket[8] = ", Array_TM_OrderTicket[8],
         "\n", "Array_TM_OrderTicket[9] = ", Array_TM_OrderTicket[9],

         "\n", "Array_TM_OrderTicket[10] = ", Array_TM_OrderTicket[10],
         "\n", "Array_TM_OrderTicket[11] = ", Array_TM_OrderTicket[11],
         "\n", "Array_TM_OrderTicket[12] = ", Array_TM_OrderTicket[12],
         "\n", "Array_TM_OrderTicket[13] = ", Array_TM_OrderTicket[13],
         "\n", "Array_TM_OrderTicket[14] = ", Array_TM_OrderTicket[14],
         "\n", "Array_TM_OrderTicket[15] = ", Array_TM_OrderTicket[15],
         "\n",
         "\n",
         "\n", "ArraySize(Array_TM_OrderTimeClose) = ", ArraySize(Array_TM_OrderTimeClose),
         "\n",
         "\n", "TM_Counter = ", TM_Counter,
         "\n",
         "\n" );
   */
//   return;
}

// EO TEST_MODE - SORT ARRAYS BY ORDERS TIME CLOSE
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++









// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// TEST_MODE - STATISTICS ACCUMULATION

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void FUNCTION_TEST_MODE(bool Mode_TEST_Comments, bool Mode_TEST_TABLE, bool Mode_Deinit) {
//   if(Mode_TEST==true   &&   IsOptimization()==false   &&   (Orders_History_Total!=OrdersHistoryTotal()   &&   Mode_Deinit==false)   ||   Mode_Deinit==true ) {  // ORIG, BUT WITH WARNINGS
   if(Mode_TEST==true   &&   IsOptimization()==false   &&   ((Orders_History_Total!=OrdersHistoryTotal()   &&   Mode_Deinit==false)   ||   Mode_Deinit==true) ) {  // FIXED WARNING, BUT DIDN'T CHECK RESULTS <= MIGHT BE WRONG CHANGE
      Orders_History_Total                              = OrdersHistoryTotal();
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
      /*
               double Max_Total_Profit_PIPS                   = MathRound((AccountBalance()-Account_Balance_INIT)/LotVal);

               int    counter_Max_Trades_BE                   = 0;
               int    counter_Max_Trades_Profitable           = 0;
               int    counter_Max_Trades_Losing               = 0;

               int    counter_Total_Trades                    = 0;
               int    counter_Total_Trades_BE                 = 0;
               int    counter_Total_Trades_Profitable         = 0;
               int    counter_Total_Trades_Losing             = 0;

               int    Max_Trades_BE                           = 0;
               int    Max_Trades_Profitable                   = 0;
               int    Max_Trades_Losing                       = 0;

               double Aver_Profit_In_Profitable               = 0.0;
               double Aver_Loss_In_Losing                     = 0.0;
      */
      Max_Total_Profit_PIPS                          = MathRound((AccountBalance()-Account_Balance_INIT) * LotVal);
//Print("Max_Total_Profit_PIPS = ", Max_Total_Profit_PIPS);
//Print("AccountBalance() = ", AccountBalance());
//Print("Account_Balance_INIT = ", Account_Balance_INIT);
//Print("LotVal = ", LotVal);
      counter_Max_Trades_BE                          = 0;
      counter_Max_Trades_Profitable                  = 0;
      counter_Max_Trades_Losing                      = 0;
      counter_Total_Trades                           = 0;
      counter_Total_Trades_BE                        = 0;
      counter_Total_Trades_Profitable                = 0;
      counter_Total_Trades_Losing                    = 0;
      Max_Trades_BE                                  = 0;
      Max_Trades_Profitable                          = 0;
      Max_Trades_Losing                              = 0;
      Aver_Profit_In_Profitable                      = 0.0;
      Aver_Loss_In_Losing                            = 0.0;
      double Total_Profit_In_Profitable              = 0.0;
      double Total_Loss_In_Losing                    = 0.0;
      FUNCTION_TM_SORT_ARRAYS();
      for(int cnt_TEST_Hist=0; cnt_TEST_Hist<ArraySize(Array_TM_OrderTicket); cnt_TEST_Hist++) {
         if(OrderSelect(Array_TM_OrderTicket[cnt_TEST_Hist], SELECT_BY_TICKET)==true) {
            if(OrderSymbol()==Symbol()   &&   OrderCloseTime()!=0   &&   OrderMagicNumber()==My_Magic_Number) {
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// COUNT NUMBER OF BREAKEVENS (Delta_Profit_Loss<=SM_3__BE__Delta_Pips)
//                  if(SM_3_Mode_BE==true) {
               if(OrderType()==OP_BUY   ||   OrderType()==OP_SELL) {
                  if( MathAbs(OrderOpenPrice()-OrderClosePrice())<=SM_3__BE__Delta_Pips*PointX ) {
                     counter_Max_Trades_BE        = counter_Max_Trades_BE   + 1;
                     counter_Total_Trades_BE      = counter_Total_Trades_BE + 1;
                     counter_Total_Trades         = counter_Total_Trades    + 1;
                  }
                  if(counter_Max_Trades_BE>Max_Trades_BE) {
                     Max_Trades_BE                = counter_Max_Trades_BE;
                  }
               }
//                  }
// EO COUNT NUMBER OF BREAKEVENS (Delta_Profit_Loss<10_Pips)
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// COUNT MAX PROFITABLE TRADES IN A ROW ---
               if(OrderType()==OP_BUY) {
                  if( (OrderClosePrice()-OrderOpenPrice())>SM_3__BE__Delta_Pips*PointX ) {
                     counter_Max_Trades_Profitable   = counter_Max_Trades_Profitable   + 1;
                     counter_Total_Trades_Profitable = counter_Total_Trades_Profitable + 1;
                     counter_Total_Trades            = counter_Total_Trades            + 1;
                     counter_Max_Trades_Losing       = 0;
                     counter_Max_Trades_BE           = 0;
                     Total_Profit_In_Profitable      = Total_Profit_In_Profitable      + OrderProfit();
                     if(Mode_TEST___Mark_Profits==true) {
                        FUNCTION_DRAW_TLINE("MyLine_PROFIT_Buy_#"+OrderTicket()+"_", OrderOpenTime(),OrderOpenPrice()+50*PointX,     OrderOpenTime(),OrderOpenPrice()+60*PointX,    Color_Profit_Buy);   // void FUNCTION_DRAW_TLINE(string Line_Name, datetime Time_1, double Price_1, datetime Time_2, double Price_2, color Line_Color)
                     }
                  }
               }
               if(OrderType()==OP_SELL) {
                  if( (OrderOpenPrice()-OrderClosePrice())>SM_3__BE__Delta_Pips*PointX ) {
                     counter_Max_Trades_Profitable   = counter_Max_Trades_Profitable   + 1;
                     counter_Total_Trades_Profitable = counter_Total_Trades_Profitable + 1;
                     counter_Total_Trades            = counter_Total_Trades            + 1;
                     counter_Max_Trades_Losing       = 0;
                     counter_Max_Trades_BE           = 0;
                     Total_Profit_In_Profitable      = Total_Profit_In_Profitable      + OrderProfit();
                     if(Mode_TEST___Mark_Profits==true) {
                        FUNCTION_DRAW_TLINE("MyLine_PROFIT_Sell_#"+OrderTicket()+"_", OrderOpenTime(),OrderOpenPrice()-50*PointX,     OrderOpenTime(),OrderOpenPrice()-60*PointX,    Color_Profit_Sell);   // void FUNCTION_DRAW_TLINE(string Line_Name, datetime Time_1, double Price_1, datetime Time_2, double Price_2, color Line_Color)
                     }
                  }
               }
               if(counter_Max_Trades_Profitable>Max_Trades_Profitable) {
                  Max_Trades_Profitable              = counter_Max_Trades_Profitable;
               }
// EO COUNT MAX PROFITABLE TRADES IN A ROW ---
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// COUNT MAX LOSING TRADES IN A ROW ---
               if(OrderType()==OP_BUY) {
                  if( (OrderOpenPrice()-OrderClosePrice())>SM_3__BE__Delta_Pips*PointX ) {
                     counter_Max_Trades_Losing       = counter_Max_Trades_Losing       + 1;
                     counter_Total_Trades_Losing     = counter_Total_Trades_Losing     + 1;
                     counter_Total_Trades            = counter_Total_Trades            + 1;
                     counter_Max_Trades_Profitable   = 0;
                     counter_Max_Trades_BE           = 0;
                     Total_Loss_In_Losing            = MathAbs(Total_Loss_In_Losing)   + MathAbs(OrderProfit());
                     if(Mode_TEST___Mark_Losses==true) {
                        FUNCTION_DRAW_TLINE("MyLine_LOSING_Buy_#"+OrderTicket()+"_", OrderOpenTime(),OrderOpenPrice()+50*PointX,     OrderOpenTime(),OrderOpenPrice()+60*PointX,    Color_Losing_Buy);   // void FUNCTION_DRAW_TLINE(string Line_Name, datetime Time_1, double Price_1, datetime Time_2, double Price_2, color Line_Color)
                     }
                  }
               }
               if(OrderType()==OP_SELL) {
                  if( (OrderClosePrice()-OrderOpenPrice())>SM_3__BE__Delta_Pips*PointX ) {
                     counter_Max_Trades_Losing       = counter_Max_Trades_Losing       + 1;
                     counter_Total_Trades_Losing     = counter_Total_Trades_Losing     + 1;
                     counter_Total_Trades            = counter_Total_Trades            + 1;
                     counter_Max_Trades_Profitable   = 0;
                     counter_Max_Trades_BE           = 0;
                     Total_Loss_In_Losing            = MathAbs(Total_Loss_In_Losing)   + MathAbs(OrderProfit());
                     if(Mode_TEST___Mark_Losses==true) {
                        FUNCTION_DRAW_TLINE("MyLine_LOSING_Sell_#"+OrderTicket()+"_", OrderOpenTime(),OrderOpenPrice()-50*PointX,     OrderOpenTime(),OrderOpenPrice()-60*PointX,    Color_Losing_Sell);   // void FUNCTION_DRAW_TLINE(string Line_Name, datetime Time_1, double Price_1, datetime Time_2, double Price_2, color Line_Color)
                     }
                  }
               }
               if(counter_Max_Trades_Losing>Max_Trades_Losing) {
                  Max_Trades_Losing                  = counter_Max_Trades_Losing;
               }
// EO COUNT MAX LOSING TRADES IN A ROW ---
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
            } // if(OrderSymbol()==Symbol()   &&   OrderCloseTime()!=0   &&   OrderMagicNumber()==My_Magic_Number) {
         } // if(OrderSelect(cnt_TEST_Hist, SELECT_BY_TICKET)==true) {
      } // for(int cnt_BE=0; cnt_BE<OrdersTotal(); cnt_BE++) {
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// COUNT MAX TRADES CLOSED ON BE ---
      if(counter_Max_Trades_BE>Max_Trades_BE) {
         Max_Trades_BE                               = counter_Max_Trades_BE;
      }
// EO COUNT MAX TRADES CLOSED ON BE ---
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
      if(counter_Total_Trades>0 ) {
//            double Percent_BreakEven  = (counter_Total_Trades_BE         * 100) / (counter_Total_Trades);
//            double Percent_Profitable = (counter_Total_Trades_Profitable * 100) / (counter_Total_Trades);
//            double Percent_Losing     = (counter_Total_Trades_Losing     * 100) / (counter_Total_Trades);
         Percent_BreakEven         = (counter_Total_Trades_BE         * 100) / (counter_Total_Trades);
         Percent_Profitable        = (counter_Total_Trades_Profitable * 100) / (counter_Total_Trades);
         Percent_Losing            = (counter_Total_Trades_Losing     * 100) / (counter_Total_Trades);
      }
      if(counter_Total_Trades_Profitable>0 ) {
         Aver_Profit_In_Profitable = Total_Profit_In_Profitable / counter_Total_Trades_Profitable;
      }
      if(counter_Total_Trades_Losing>0 ) {
         Aver_Loss_In_Losing       = Total_Loss_In_Losing       / counter_Total_Trades_Losing;
      }
      /*
               if(Mode_TEST_Comments==true) {
                  Comment(
      //               "\n",
      //               "\n", "SPREAD                       = ", (Ask-Bid)/PointX,
                     "\n", "Account__________[$]        = ", MathMin(MathRound(AccountBalance()), MathRound(AccountEquity())),
                     "\n", "Total_Profit                            = ", MathRound(AccountBalance()-Account_Balance_INIT), " [$] <> ", Max_Total_Profit_PIPS, " [Pips]",
                     "\n", "Average_Profit_____[$]        = ", MathRound(Aver_Profit_In_Profitable),
                     "\n", "Average_Loss______[$]        = ", MathRound(Aver_Loss_In_Losing),
                     "\n", "Max In_Row Trades BE          = ", Max_Trades_BE,
                     "\n", "Max In_Row Trades Profitable = ", Max_Trades_Profitable,
                     "\n", "Max In_Row Trades Losing     = ", Max_Trades_Losing,
                     "\n", "Total Trades BE                      = ", counter_Total_Trades_BE, " (", Percent_BreakEven, " %)",
                     "\n", "Total Trades Profitable            = ", counter_Total_Trades_Profitable, " (", Percent_Profitable, " %)",
                     "\n", "Total Trades Losing                = ", counter_Total_Trades_Losing, " (", Percent_Losing, " %)",
                     "\n", "Total_Trades [REAL]              = ", counter_Total_Trades,
      //               "\n", "=======================        ",
                     "\n", "MaxEquity __________[$]    = ", MaxEquity,
      //               "\n", "Equity__Current______[$]   = ", Equity_Current,
      //               "\n", "Balance_Current______[$]    = ", Balance_Current,
                     "\n", "Equity__Current______[$]   = ", NormalizeDouble(AccountEquity(), 1),
                     "\n", "Balance_Current______[$]    = ", NormalizeDouble(AccountBalance(),1),
                     "\n", "Local_Drawdown_____[%]   = ", Local_DD_X,
                     "\n", "Relative_Drawdown___[%]   = ", Relative_Drawdown,
      //               "\n", "AccountProfit()_______[$]   = ", AccountProfit(),
                  "\n"
                  );
               } // if(Mode_TEST_Comments==true) {
      */
//Print("Баланс счета = ",AccountBalance());
//Print("Прибыль ", AccountProfit());
      if(Mode_TEST_TABLE==true) {
         Print("");
         Print("====================================================================================");
         Print("  <>  ", Symbol(), "  <>  Time Frame [Minutes]         = ", Period() );
         Print("------------------------------------------------------------------------------------");
         Print("  <>  ", Symbol(), "  <>  Account Balance INIT         = ", MathRound(Account_Balance_INIT) );
         Print("  <>  ", Symbol(), "  <>  Account Balance              = ", MathRound(AccountBalance()) );
         Print("  <>  ", Symbol(), "  <>  Account Equity               = ", MathRound(AccountEquity()) );
         Print("------------------------------------------------------------------------------------");
         Print("  <>  ", Symbol(), "  <>  Orders History Total         = ", OrdersHistoryTotal() );
         Print("------------------------------------------------------------------------------------");
         Print("  <>  ", Symbol(), "  <>  1 Lot Cost [$]               = ", LotVal );
         Print("------------------------------------------------------------------------------------");
         Print("  <>  ", Symbol(), "  <>  PROFIT TOTAL [Pips]          = ", Max_Total_Profit_PIPS );
         Print("  <>  ", Symbol(), "  <>  PROFIT TOTAL [$$]            = ", MathRound(AccountBalance()-Account_Balance_INIT) );
         Print("------------------------------------------------------------------------------------");
         Print("  <>  ", Symbol(), "  <>  Max In_Row Trades BE         = ", Max_Trades_BE );
         Print("  <>  ", Symbol(), "  <>  Max In_Row Trades Profitable = ", Max_Trades_Profitable );
         Print("  <>  ", Symbol(), "  <>  Max In_Row Trades Losing     = ", Max_Trades_Losing );
         Print("------------------------------------------------------------------------------------");
         Print("  <>  ", Symbol(), "  <>  Total Trades BE              (", Percent_BreakEven, " %) = ", counter_Total_Trades_BE );
         Print("  <>  ", Symbol(), "  <>  Total Trades Profitable      (", Percent_Profitable, " %) = ", counter_Total_Trades_Profitable );
         Print("  <>  ", Symbol(), "  <>  Total Trades Losing          (", Percent_Losing, " %) = ", counter_Total_Trades_Losing );
         Print("  <>  ", Symbol(), "  <>  Total Trades [REAL]          = ", counter_Total_Trades );
         Print("------------------------------------------------------------------------------------");
         Print("  <>  ", Symbol(), "  <>  Average Profit [$$]          = ", MathRound(Aver_Profit_In_Profitable) );
         Print("  <>  ", Symbol(), "  <>  Average Loss   [$$]          = ", MathRound(Aver_Loss_In_Losing) );
         Print("====================================================================================");
         Print("");
      } // if(Mode_TEST_TABLE==true) {
   } // if(Mode_TEST==true   &&   IsOptimization()==false   &&   (Orders_History_Total!=OrdersHistoryTotal()   &&   Mode_Deinit==false)   ||   Mode_Deinit==true ) {
} // void FUNCTION_TEST_MODE(Mode_TEST_Comments, Mode_TEST_TABLE) {

// EO TEST_MODE - STATISTICS ACCUMULATION
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++






















// OP_BUY       0 Покупка
// OP_SELL      1 Продажа
// OP_BUYLIMIT  2 Отложенный ордер BUY LIMIT
// OP_SELLLIMIT 3 Отложенный ордер SELL LIMIT
// OP_BUYSTOP   4 Отложенный ордер BUY STOP
// OP_SELLSTOP  5 Отложенный ордер SELL STOP

// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
void FUNCTION_SHOW_ORDERS_INFO(int Order_Ticket_Number, int Order_Type, int Order_Profit, int Order_TP, int Order_SL, int X2, int Y2 ) {
   string Text_Output;
   if(Order_Type==OP_BUY) {
      Text_Output                   = "Buy__R";
   }
   if(Order_Type==OP_SELL) {
      Text_Output                   = "Sell_R";
   }
   if(Order_Type==OP_BUYLIMIT) {
      Text_Output                   = "Buy__L";
   }
   if(Order_Type==OP_SELLLIMIT) {
      Text_Output                   = "Sell_L";
   }
   if(Order_Type==OP_BUYSTOP) {
      Text_Output                   = "Buy__S";
   }
   if(Order_Type==OP_SELLSTOP) {
      Text_Output                   = "Sell_S";
   }
   string        MyLabel_TXT        = Text_Output+"___#"+DoubleToStr(Order_Ticket_Number,0);
   ObjectCreate( MyLabel_TXT, OBJ_LABEL,          0, 0, 0);
   ObjectSet(    MyLabel_TXT, OBJPROP_CORNER,     1 );                                           // Corner
   ObjectSet(    MyLabel_TXT, OBJPROP_XDISTANCE,  X2);
   ObjectSet(    MyLabel_TXT, OBJPROP_YDISTANCE,  Y2);
   ObjectSetText(MyLabel_TXT, Text_Output, Text_Font_Size, Text_Font, Color_Text_Passive);
   color Color_Profit               = Color_Text_Active;
   if(Order_Type==OP_BUY   ||   Order_Type==OP_SELL) {
      if(Order_Profit>0) {
         Color_Profit               = Green;
      }
      if(Order_Profit==0) {
         Color_Profit               = DeepSkyBlue;
      }
      if(Order_Profit<0) {
         Color_Profit               = Red;
      }
      string        MyLabel_PFT     = Text_Output+"___#"+DoubleToStr(Order_Ticket_Number,0)+"___Profit";
      ObjectCreate( MyLabel_PFT, OBJ_LABEL,          0, 0, 0);
      ObjectSet(    MyLabel_PFT, OBJPROP_CORNER,     1 );                                          // Corner
//      ObjectSet(    MyLabel_PFT, OBJPROP_XDISTANCE,  X2+75);
      ObjectSet(    MyLabel_PFT, OBJPROP_XDISTANCE,  X2+125);
      ObjectSet(    MyLabel_PFT, OBJPROP_YDISTANCE,  Y2);
      ObjectSetText(MyLabel_PFT, DoubleToStr(Order_Profit,0), Text_Font_Size, Text_Font, Color_Profit);
   } // if(Order_Type==OP_BUY   ||   Order_Type==OP_SELL) {
   string        MyLabel_TP         = Text_Output+"___#"+DoubleToStr(Order_Ticket_Number,0)+"___TP";
   ObjectCreate( MyLabel_TP,  OBJ_LABEL,          0, 0, 0);
   ObjectSet(    MyLabel_TP,  OBJPROP_CORNER,     1 );                                             // Corner
   ObjectSet(    MyLabel_TP,  OBJPROP_XDISTANCE,  X2-55);
   ObjectSet(    MyLabel_TP,  OBJPROP_YDISTANCE,  Y2);
   ObjectSetText(MyLabel_TP,  DoubleToStr(Order_TP,0), Text_Font_Size, Text_Font, Color_Profit);
   string        MyLabel_SL         = Text_Output+"___#"+DoubleToStr(Order_Ticket_Number,0)+"___SL";
   ObjectCreate( MyLabel_SL,  OBJ_LABEL,          0, 0, 0);
   ObjectSet(    MyLabel_SL,  OBJPROP_CORNER,     1 );                                             // Corner
   ObjectSet(    MyLabel_SL,  OBJPROP_XDISTANCE,  X2-110);
   ObjectSet(    MyLabel_SL,  OBJPROP_YDISTANCE,  Y2);
   ObjectSetText(MyLabel_SL,  DoubleToStr(Order_SL,0), Text_Font_Size, Text_Font, Color_Profit);
}
// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++














// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
void FUNCTION_SHOW_ORDERS_MANAGE() {
   int Counter_Real                                      = 0;
   int Counter_Stop                                      = 0;
   int Counter_Limit                                     = 0;
   int Array_Orders_Real[][5];
   int Array_Orders_Stop[][5];
   int Array_Orders_Limit[][5];
   if(OrdersTotal()>0) {
      for(int cnt_13=OrdersTotal()-1; cnt_13>=0; cnt_13--) {
         if(OrderSelect(cnt_13, SELECT_BY_POS, MODE_TRADES)==true) {
            if(OrderSymbol()==Symbol()   &&   OrderMagicNumber()==My_Magic_Number) {
               if(OrderType()==OP_BUY        ||   OrderType()==OP_SELL) {
                  Counter_Real                           = Counter_Real + 1;
                  ArrayResize(Array_Orders_Real,  Counter_Real);
                  int   Profit_Value                     = 0;
                  int   SL_Value                         = 0;
                  if(OrderType()==OP_BUY) {
                     Profit_Value                       = MathRound((Bid - OrderOpenPrice())/PointX);
                     SL_Value                           = MathRound((OrderStopLoss()  - OrderOpenPrice())/PointX);
                  }
                  if(OrderType()==OP_SELL) {
                     Profit_Value                        = MathRound((OrderOpenPrice() - Ask)/PointX);
                     SL_Value                           = MathRound((OrderOpenPrice() - OrderStopLoss())/PointX);
                  }
                  Array_Orders_Real[Counter_Real-1][0]   = OrderTicket();
                  Array_Orders_Real[Counter_Real-1][1]   = OrderType();
                  Array_Orders_Real[Counter_Real-1][2]   = Profit_Value;
                  Array_Orders_Real[Counter_Real-1][3]   = MathAbs(MathRound((OrderTakeProfit()-OrderOpenPrice())/PointX));
                  Array_Orders_Real[Counter_Real-1][4]   = SL_Value;
               }
               if(OrderType()==OP_BUYSTOP    ||    OrderType()==OP_SELLSTOP) {
                  Counter_Stop                           = Counter_Stop + 1;
                  ArrayResize(Array_Orders_Stop,   Counter_Stop);
                  Array_Orders_Stop[Counter_Stop-1][0]   = OrderTicket();
                  Array_Orders_Stop[Counter_Stop-1][1]   = OrderType();
                  Array_Orders_Stop[Counter_Stop-1][2]   = OrderProfit();
                  Array_Orders_Stop[Counter_Stop-1][3]   = MathAbs(MathRound((OrderTakeProfit()-OrderOpenPrice())/PointX));
                  Array_Orders_Stop[Counter_Stop-1][4]   = MathAbs(MathRound((OrderStopLoss()  -OrderOpenPrice())/PointX));
               }
               if(OrderType()==OP_BUYLIMIT   ||    OrderType()==OP_SELLLIMIT) {
                  Counter_Limit                          = Counter_Limit + 1;
                  ArrayResize(Array_Orders_Limit,  Counter_Limit);
                  Array_Orders_Limit[Counter_Limit-1][0] = OrderTicket();
                  Array_Orders_Limit[Counter_Limit-1][1] = OrderType();
                  Array_Orders_Limit[Counter_Limit-1][2] = OrderProfit();
                  Array_Orders_Limit[Counter_Limit-1][3] = MathAbs(MathRound((OrderTakeProfit()-OrderOpenPrice())/PointX));
                  Array_Orders_Limit[Counter_Limit-1][4] = MathAbs(MathRound((OrderStopLoss()  -OrderOpenPrice())/PointX));
               }
            } // if(OrderSymbol()==Symbol()   &&   OrderMagicNumber()==My_Magic_Number) {
         } // if(OrderSelect(cnt_12, SELECT_BY_POS, MODE_TRADES)==true) {
      } // for(int cnt_12=OrdersTotal()-1; cnt_12>=0; cnt_12--) {
   } // if(OrdersTotal()>0) {
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   int Y_Delta                                           = 0;
   if(Counter_Real>=1) {
      for(int cnt_14=0; cnt_14<Counter_Real; cnt_14++) {
         FUNCTION_SHOW_ORDERS_INFO(
            Array_Orders_Real[cnt_14][0],                // int Order_Ticket_Number,
            Array_Orders_Real[cnt_14][1],                // int Order_Type,
            Array_Orders_Real[cnt_14][2],                // int Order_Profit,
            Array_Orders_Real[cnt_14][3],                // int Order_TP,
            Array_Orders_Real[cnt_14][4],                // int Order_SL,
            115,                                         // int X2,
            5 + Y_Delta                                  // int Y2
         ); // FUNCTION_SHOW_ORDERS_INFO
         Y_Delta                                         = Y_Delta + 20;
      } // for(int cnt_14=0; cnt_14<Counter_Real; cnt_14++) {
   } // if(Counter_Real>=1) {
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   int Y_Delta_STOP                                      = 20;
   if(Counter_Stop>=1) {
      for(int cnt_15=0; cnt_15<Counter_Stop; cnt_15++) {
         FUNCTION_SHOW_ORDERS_INFO(
            Array_Orders_Stop[cnt_15][0],                // int Order_Ticket_Number,
            Array_Orders_Stop[cnt_15][1],                // int Order_Type,
            Array_Orders_Stop[cnt_15][2],                // int Order_Profit,
            Array_Orders_Stop[cnt_15][3],                // int Order_TP,
            Array_Orders_Stop[cnt_15][4],                // int Order_SL,
            115,                                         // int X2,
            5 + Y_Delta + Y_Delta_STOP                   // int Y2
         ); // FUNCTION_SHOW_ORDERS_INFO
         Y_Delta_STOP                                     = Y_Delta_STOP + 20;
      } // for(int cnt_14=0; cnt_14<Counter_Stop; cnt_14++) {
   } // if(Counter_Stop>=1) {
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   int Y_Delta_LIMIT                                      = 20;
   if(Counter_Limit>=1) {
      for(int cnt_16=0; cnt_16<Counter_Limit; cnt_16++) {
         FUNCTION_SHOW_ORDERS_INFO(
            Array_Orders_Limit[cnt_16][0],                // int Order_Ticket_Number,
            Array_Orders_Limit[cnt_16][1],                // int Order_Type,
            Array_Orders_Limit[cnt_16][2],                // int Order_Profit,
            Array_Orders_Limit[cnt_16][3],                // int Order_TP,
            Array_Orders_Limit[cnt_16][4],                // int Order_SL,
            115,                                          // int X2,
            5 + Y_Delta + Y_Delta_STOP + Y_Delta_LIMIT    // int Y2
         ); // FUNCTION_SHOW_ORDERS_INFO
         Y_Delta_LIMIT                                    = Y_Delta_LIMIT + 20;
      } // for(int cnt_14=0; cnt_14<Counter_Limit; cnt_14++) {
   } // if(Counter_Limit>=1) {
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
}
// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++












// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// LOCAL_DD_CALC

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void FUNCTION_LOCAL_DD_CALC(bool Mode_LOCAL_DD__Calc_Only) {
   if(Equity_MAX_X<Equity_Current) {
      Equity_MAX_X                 = Equity_Current;
   }
//   if(OrdersTotal()<=0 ) {
//      Equity_MAX_X                 = Equity_Current;
//   }
   if(Equity_MAX_X>0.0) {
      Local_DD_X_Prev              = Local_DD_X;
      Local_DD_X                   = StrToDouble(DoubleToStr(100.0 - ((Equity_Current*100.0)/Equity_MAX_X),2));
   } // if(Equity_MAX_X>0.0) {
} // void FUNCTION_LOCAL_DD_CALC(bool Mode_LOCAL_DD__Calc_Only) {

// EO LOCAL_DD_CALC
// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++












// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// TERMINAL VARIABLES DEFINE

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void FUNCTION_TERMINAL_VARIABLES() {
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_1_Mode_TP_INIT_Mult_SL") )
      SM_1_Mode_TP_INIT_Mult_SL = GlobalVariableGet("SM_1_Mode_TP_INIT_Mult_SL");
   else
      GlobalVariableSet("SM_1_Mode_TP_INIT_Mult_SL",SM_1_Mode_TP_INIT_Mult_SL);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_1_TP_INIT_Multiplier") )
      SM_1_TP_INIT_Multiplier = GlobalVariableGet("SM_1_TP_INIT_Multiplier");
   else
      GlobalVariableSet("SM_1_TP_INIT_Multiplier",SM_1_TP_INIT_Multiplier);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_1__TP_Fixed") )
      SM_1__TP_Fixed = GlobalVariableGet("SM_1__TP_Fixed");
   else
      GlobalVariableSet("SM_1__TP_Fixed",SM_1__TP_Fixed);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_2__SL_Fixed") )
      SM_2__SL_Fixed = GlobalVariableGet("SM_2__SL_Fixed");
   else
      GlobalVariableSet("SM_2__SL_Fixed",SM_2__SL_Fixed);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_2_Mode_SL_Opt__ATR_0__FX_1") )
      SM_2_Mode_SL_Opt__ATR_0__FX_1 = GlobalVariableGet("SM_2_Mode_SL_Opt__ATR_0__FX_1");
   else
      GlobalVariableSet("SM_2_Mode_SL_Opt__ATR_0__FX_1",SM_2_Mode_SL_Opt__ATR_0__FX_1);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_2__Mode_SL") )
      SM_2__Mode_SL = GlobalVariableGet("SM_2__Mode_SL");
   else
      GlobalVariableSet("SM_2__Mode_SL",SM_2__Mode_SL);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_2___SL__ADR_Period") )
      SM_2___SL__ADR_Period = GlobalVariableGet("SM_2___SL__ADR_Period");
   else
      GlobalVariableSet("SM_2___SL__ADR_Period",SM_2___SL__ADR_Period);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_2___SL__ADR_Multiplier") )
      SM_2___SL__ADR_Multiplier = GlobalVariableGet("SM_2___SL__ADR_Multiplier");
   else
      GlobalVariableSet("SM_2___SL__ADR_Multiplier",SM_2___SL__ADR_Multiplier);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_3_Mode_BE") )
      SM_3_Mode_BE = GlobalVariableGet("SM_3_Mode_BE");
   else
      GlobalVariableSet("SM_3_Mode_BE",SM_3_Mode_BE);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_3_Mode_BE_Equal_SL") )
      SM_3_Mode_BE_Equal_SL = GlobalVariableGet("SM_3_Mode_BE_Equal_SL");
   else
      GlobalVariableSet("SM_3_Mode_BE_Equal_SL",SM_3_Mode_BE_Equal_SL);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_3__BE_Fixed") )
      SM_3__BE_Fixed = GlobalVariableGet("SM_3__BE_Fixed");
   else
      GlobalVariableSet("SM_3__BE_Fixed",SM_3__BE_Fixed);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_4_Mode_TS") )
      SM_4_Mode_TS = GlobalVariableGet("SM_4_Mode_TS");
   else
      GlobalVariableSet("SM_4_Mode_TS",SM_4_Mode_TS);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_4_Mode_TS_On_BE_Only") )
      SM_4_Mode_TS_On_BE_Only = GlobalVariableGet("SM_4_Mode_TS_On_BE_Only");
   else
      GlobalVariableSet("SM_4_Mode_TS_On_BE_Only",SM_4_Mode_TS_On_BE_Only);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_4_Mode_TS_On_BE_Only_Once") )
      SM_4_Mode_TS_On_BE_Only_Once = GlobalVariableGet("SM_4_Mode_TS_On_BE_Only_Once");
   else
      GlobalVariableSet("SM_4_Mode_TS_On_BE_Only_Once",SM_4_Mode_TS_On_BE_Only_Once);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_4_Mode_TS_Show_SL") )
      SM_4_Mode_TS_Show_SL = GlobalVariableGet("SM_4_Mode_TS_Show_SL");
   else
      GlobalVariableSet("SM_4_Mode_TS_Show_SL",SM_4_Mode_TS_Show_SL);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_4_TS_Fixed") )
      SM_4_TS_Fixed = GlobalVariableGet("SM_4_TS_Fixed");
   else
      GlobalVariableSet("SM_4_TS_Fixed",SM_4_TS_Fixed);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_4_TS_Step") )
      SM_4_TS_Step = GlobalVariableGet("SM_4_TS_Step");
   else
      GlobalVariableSet("SM_4_TS_Step",SM_4_TS_Step);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_5_Mode_TimeBased_OC") )
      SM_5_Mode_TimeBased_OC = GlobalVariableGet("SM_5_Mode_TimeBased_OC");
   else
      GlobalVariableSet("SM_5_Mode_TimeBased_OC",SM_5_Mode_TimeBased_OC);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_5__Max_Bars_TimeBased_OC") )
      SM_5__Max_Bars_TimeBased_OC = GlobalVariableGet("SM_5__Max_Bars_TimeBased_OC");
   else
      GlobalVariableSet("SM_5__Max_Bars_TimeBased_OC",SM_5__Max_Bars_TimeBased_OC);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_5__Profit_TB_OC_PIPS") )
      SM_5__Profit_TB_OC_PIPS = GlobalVariableGet("SM_5__Profit_TB_OC_PIPS");
   else
      GlobalVariableSet("SM_5__Profit_TB_OC_PIPS",SM_5__Profit_TB_OC_PIPS);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_6_Mode_MM") )
      SM_6_Mode_MM = GlobalVariableGet("SM_6_Mode_MM");
   else
      GlobalVariableSet("SM_6_Mode_MM",SM_6_Mode_MM);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_6__MM_Risk_Percent") )
      SM_6__MM_Risk_Percent = GlobalVariableGet("SM_6__MM_Risk_Percent");
   else
      GlobalVariableSet("SM_6__MM_Risk_Percent",SM_6__MM_Risk_Percent);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_6__Order_Lots") )
      // !!!!!!!!!!!!!!!! ДОБАВИТЬ ПРОВЕРКУ - ЕСЛИ ГЛОБАЛЬНЫЕ ЛОТЫ МЕНЬШЕ МИН ДОПУСТИМЫХ ЛОТОВ БРОКЕРА => НАПЕЧАТАТЬ ОШИБКУ И ОСТАНОВИТЬСЯ!!!
      // ??????????????????????????????????????????????????????????????????????????????
      SM_6__Order_Lots = GlobalVariableGet("SM_6__Order_Lots");
   else
      GlobalVariableSet("SM_6__Order_Lots",SM_6__Order_Lots);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_7_Mode_Trading_Session") )
      SM_7_Mode_Trading_Session = GlobalVariableGet("SM_7_Mode_Trading_Session");
   else
      GlobalVariableSet("SM_7_Mode_Trading_Session",SM_7_Mode_Trading_Session);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_7_Show_Sess_Borders") )
      SM_7_Show_Sess_Borders = GlobalVariableGet("SM_7_Show_Sess_Borders");
   else
      GlobalVariableSet("SM_7_Show_Sess_Borders",SM_7_Show_Sess_Borders);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_7__Sess_RECT_or_VLINE") )
      SM_7__Sess_RECT_or_VLINE = GlobalVariableGet("SM_7__Sess_RECT_or_VLINE");
   else
      GlobalVariableSet("SM_7__Sess_RECT_or_VLINE",SM_7__Sess_RECT_or_VLINE);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_8_Hard_Limit_StopLevel") )
      SM_8_Hard_Limit_StopLevel = GlobalVariableGet("SM_8_Hard_Limit_StopLevel");
   else
      GlobalVariableSet("SM_8_Hard_Limit_StopLevel",SM_8_Hard_Limit_StopLevel);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_8_Hard_Limit_MIN_SL") )
      SM_8_Hard_Limit_MIN_SL = GlobalVariableGet("SM_8_Hard_Limit_MIN_SL");
   else
      GlobalVariableSet("SM_8_Hard_Limit_MIN_SL",SM_8_Hard_Limit_MIN_SL);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_9_Mode_Show_ADR_Borders") )
      SM_9_Mode_Show_ADR_Borders = GlobalVariableGet("SM_9_Mode_Show_ADR_Borders");
   else
      GlobalVariableSet("SM_9_Mode_Show_ADR_Borders",SM_9_Mode_Show_ADR_Borders);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_9_Period_ADR") )
      SM_9_Period_ADR = GlobalVariableGet("SM_9_Period_ADR");
   else
      GlobalVariableSet("SM_9_Period_ADR",SM_9_Period_ADR);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM__10_Make_TESTER_Template") )
      SM__10_Make_TESTER_Template = GlobalVariableGet("SM__10_Make_TESTER_Template");
   else
      GlobalVariableSet("SM__10_Make_TESTER_Template",SM__10_Make_TESTER_Template);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_0______________________") )
      SM_0______________________ = GlobalVariableGet("SM_0______________________");
   else
      GlobalVariableSet("SM_0______________________",SM_0______________________);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_1______________________") )
      SM_1______________________ = GlobalVariableGet("SM_1______________________");
   else
      GlobalVariableSet("SM_1______________________",SM_1______________________);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_2______________________") )
      SM_2______________________ = GlobalVariableGet("SM_2______________________");
   else
      GlobalVariableSet("SM_2______________________",SM_2______________________);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_3______________________") )
      SM_3______________________ = GlobalVariableGet("SM_3______________________");
   else
      GlobalVariableSet("SM_3______________________",SM_3______________________);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_4______________________") )
      SM_4______________________ = GlobalVariableGet("SM_4______________________");
   else
      GlobalVariableSet("SM_4______________________",SM_4______________________);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_5______________________") )
      SM_5______________________ = GlobalVariableGet("SM_5______________________");
   else
      GlobalVariableSet("SM_5______________________",SM_5______________________);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_6______________________") )
      SM_6______________________ = GlobalVariableGet("SM_6______________________");
   else
      GlobalVariableSet("SM_6______________________",SM_6______________________);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_7______________________") )
      SM_7______________________ = GlobalVariableGet("SM_7______________________");
   else
      GlobalVariableSet("SM_7______________________",SM_7______________________);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_8______________________") )
      SM_8______________________ = GlobalVariableGet("SM_8______________________");
   else
      GlobalVariableSet("SM_8______________________",SM_8______________________);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM_9______________________") )
      SM_9______________________ = GlobalVariableGet("SM_9______________________");
   else
      GlobalVariableSet("SM_9______________________",SM_9______________________);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
   if ( GlobalVariableCheck("SM__10____________________") )
      SM__10____________________ = GlobalVariableGet("SM__10____________________");
   else
      GlobalVariableSet("SM__10____________________",SM__10____________________);
// ``````````````````````````````````````````````````````````````````````````````````````````````````````````````
} // void FUNCTION_LOCAL_DD_CALC(bool Mode_LOCAL_DD__Calc_Only) {

// EO TERMINAL VARIABLES DEFINE
// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
















// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// EQUITY / DRAWDOWN

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void FUNCTION_EQUITY_DRAWDOWN() {
   Equity_Current                = NormalizeDouble(AccountEquity(), 1);
   Balance_Current               = NormalizeDouble(AccountBalance(),1);
   if( Equity_Current>0.0 ) {
      if(MaxEquity<Equity_Current ) {
         MaxEquity               = Equity_Current;
         //         Lot_At_Equity_MAX       = Order_Lots;
      }
      if(DrawDownAbs<(MaxEquity-Equity_Current) ) {
         DrawDownAbs             = MaxEquity - Equity_Current;
      }
      if(MaxEquity>0.0) {
         if(DrawDownRel>(Equity_Current/MaxEquity) ) {
            DrawDownRel          = Equity_Current/MaxEquity;
            Relative_Drawdown    = 100.0 - (DrawDownRel * 100.0);
         }
      }
   }
//   if(MathRound(Relative_Drawdown)>MathRound(Relative_Drawdown_Report + 5.0) ) {
//      Relative_Drawdown_Report   = Relative_Drawdown;
//      Alert("\n\n ", Symbol()+": --------- ALERT: [RELATIVE_DD = ", DoubleToStr(Relative_Drawdown_Report,2)," %]  <<<>>> [DATE = ", TimeToStr(Time[0],TIME_DATE), "] ----------------");
//   }
//   if(IsOptimization()==false    &&   IsTesting()==true) {
   FUNCTION_LOCAL_DD_CALC(true);
//      FUNCTION_LOCAL_DD_REVERSED_CALC(true);
//      if(MathRound(Local_DD_REPORT)<MathRound(Local_DD_X) ) {
//         Local_DD_REPORT         = Local_DD_X;
//         Local_DD_REPORT_Time    = TimeToStr(Time[0],TIME_DATE);
//         Alert("\n\n ", Symbol()+": --------- ALERT: [LOCAL_DD = ", Local_DD_REPORT, " %] <<<>>> [RELATIVE_DD = ", DoubleToStr(Relative_Drawdown,2)," %]  <<<>>> [DATE = ", Local_DD_REPORT_Time, "] ----------------");
//      }
//   }
} // void FUNCTION_EQUITY_DRAWDOWN() {

// EO EQUITY / DRAWDOWN
// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++













// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// SHOW THERESHOLD_BUY_SELL MARKS = 6/3 PIPS  (ADDED TO BAR's HIGH and LOW - they are on the left side of chart) ---

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void FUNCTION_SHOW_THERESHOLD_BUY_SELL_MARKS() {
   if(Mode_Show_THRESH_B_S_Marks==true) {
      if(Time_Handle_THRESH!=Time[0]) {
         Time_Handle_THRESH             = Time[0];
         string       linename_THR_Buy  = "OLEGs___THRESH_Buy";
         ObjectDelete(linename_THR_Buy);
         ObjectCreate(linename_THR_Buy, OBJ_TREND, 0,  Time[i+WindowFirstVisibleBar()],High[i+1]+Threshold_Buy*PointX,  Time[i+WindowFirstVisibleBar()-20],High[i+1]+Threshold_Buy*PointX );
         ObjectSet(   linename_THR_Buy, OBJPROP_STYLE, STYLE_SOLID);
         ObjectSet(   linename_THR_Buy, OBJPROP_RAY,   False);
         ObjectSet(   linename_THR_Buy, OBJPROP_WIDTH, 2);
         ObjectSet(   linename_THR_Buy, OBJPROP_BACK, false);
         ObjectSet(   linename_THR_Buy, OBJPROP_COLOR, Navy);
         string       linename_THR_Sell = "OLEGs___THRESH_Sell";
         ObjectDelete(linename_THR_Sell);
         ObjectCreate(linename_THR_Sell, OBJ_TREND, 0,  Time[i+WindowFirstVisibleBar()],Low[i+1]-Threshold_Sell*PointX,  Time[i+WindowFirstVisibleBar()-20],Low[i+1]-Threshold_Sell*PointX );
         ObjectSet(   linename_THR_Sell, OBJPROP_STYLE, STYLE_SOLID);
         ObjectSet(   linename_THR_Sell, OBJPROP_RAY,   False);
         ObjectSet(   linename_THR_Sell, OBJPROP_WIDTH, 2);
         ObjectSet(   linename_THR_Sell, OBJPROP_BACK, false);
         ObjectSet(   linename_THR_Sell, OBJPROP_COLOR, Navy);
      }
   } // if(Mode_Show_THRESH_B_S_Marks==true) {
} // void FUNCTION_SHOW_THERESHOLD_BUY_SELL_MARKS() {

// EO SHOW THERESHOLD_BUY_SELL MARKS = 6/3 PIPS ---
// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++













// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// SHOW ADR LEVELS ---

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void FUNCTION_ADR_LEVELS() {
   if(SM_9_Mode_Show_ADR_Borders==true) {
      if(Time_Handle!=Time[0]) {
         Time_Handle                    = Time[0];
         double ADR_VALUE_P14           = iATR( NULL,PERIOD_D1, SM_9_Period_ADR, 1);
         double Todays_HIGH             = iHigh(NULL,PERIOD_D1, 0);
         double Todays_LOW              = iLow( NULL,PERIOD_D1, 0);
         string       MyLine_ADR_High   = "MyLine_ADR_High";
         ObjectDelete(MyLine_ADR_High);
         ObjectCreate(MyLine_ADR_High, OBJ_TREND,  0,  iTime( NULL,PERIOD_D1,0),(Todays_LOW+ADR_VALUE_P14),  Time[0],(Todays_LOW+ADR_VALUE_P14));
         ObjectSet(   MyLine_ADR_High, OBJPROP_STYLE, STYLE_SOLID);
         ObjectSet(   MyLine_ADR_High, OBJPROP_RAY,   False);
         ObjectSet(   MyLine_ADR_High, OBJPROP_WIDTH, 3);
         ObjectSet(   MyLine_ADR_High, OBJPROP_BACK, True);
         ObjectSet(   MyLine_ADR_High, OBJPROP_COLOR, DarkOrange);
         string       MyLine_ADR_Low    = "MyLine_ADR_Low";
         ObjectDelete(MyLine_ADR_Low);
         ObjectCreate(MyLine_ADR_Low,  OBJ_TREND,  0,  iTime( NULL,PERIOD_D1,0),(Todays_HIGH-ADR_VALUE_P14),  Time[0],(Todays_HIGH-ADR_VALUE_P14));
         ObjectSet(   MyLine_ADR_Low,  OBJPROP_STYLE, STYLE_SOLID);
         ObjectSet(   MyLine_ADR_Low,  OBJPROP_RAY,   False);
         ObjectSet(   MyLine_ADR_Low,  OBJPROP_WIDTH, 3);
         ObjectSet(   MyLine_ADR_Low,  OBJPROP_BACK, True);
         ObjectSet(   MyLine_ADR_Low,  OBJPROP_COLOR, DarkOrange);
         WindowRedraw();
      }
   }
} // void FUNCTION_ADR_LEVELS() {

// EO SHOW ADR LEVELS ---
// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

















// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// SESSION RECTANGLES = TRADING HOURS BORDERS ---

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void FUNCTION_SESSION_RECTANGLES() {
//      if(Period()<1440   &&   Status_Use_Trading_Session!=false ) {
   if(SM_7_Show_Sess_Borders==true   &&   Period()<1440   &&   (Time_Trading_Session_Start>0   ||   Time_Trading_Session_End>0) ) {
      if(SM_7__Sess_RECT_or_VLINE==true) {
         string       Rectangle_Session_1  = "MyLine_RECT_Start_"+Time_Trading_Session_Start;
         ObjectDelete(Rectangle_Session_1);
         ObjectCreate(Rectangle_Session_1, OBJ_RECTANGLE, 0,  iTime(NULL,PERIOD_D1,0),Ask+2000*PointX,  Time_Trading_Session_Start,Ask-2000*PointX);
         ObjectSet(   Rectangle_Session_1, OBJPROP_STYLE, STYLE_SOLID);
         ObjectSet(   Rectangle_Session_1, OBJPROP_RAY, False);
         ObjectSet(   Rectangle_Session_1, OBJPROP_WIDTH, 1);
         ObjectSet(   Rectangle_Session_1, OBJPROP_BACK, True);
         ObjectSet(   Rectangle_Session_1, OBJPROP_COLOR, Color_Trading_Session);
         string       Rectangle_Session_2  = "MyLine_RECT_End_"+Time_Trading_Session_End;
         ObjectDelete(Rectangle_Session_2);
         ObjectCreate(Rectangle_Session_2, OBJ_RECTANGLE, 0,  Time_Trading_Session_End,Ask+2000*PointX,  iTime(NULL,PERIOD_D1,0)+24*3600,Ask-2000*PointX);
         ObjectSet(   Rectangle_Session_2, OBJPROP_STYLE, STYLE_SOLID);
         ObjectSet(   Rectangle_Session_2, OBJPROP_RAY, False);
         ObjectSet(   Rectangle_Session_2, OBJPROP_WIDTH, 1);
         ObjectSet(   Rectangle_Session_2, OBJPROP_BACK, True);
         ObjectSet(   Rectangle_Session_2, OBJPROP_COLOR, Color_Trading_Session);
         if(Current_Time>Time_Trading_Session_End) {
            ObjectDelete(Rectangle_Session_2);
            ObjectCreate(Rectangle_Session_2, OBJ_RECTANGLE, 0,  Time_Trading_Session_End,Ask+2000*PointX,  Current_Time+Period()*60,Ask-2000*PointX);
            ObjectSet(   Rectangle_Session_2, OBJPROP_STYLE, STYLE_SOLID);
            ObjectSet(   Rectangle_Session_2, OBJPROP_RAY, False);
            ObjectSet(   Rectangle_Session_2, OBJPROP_WIDTH, 1);
            ObjectSet(   Rectangle_Session_2, OBJPROP_BACK, True);
            ObjectSet(   Rectangle_Session_2, OBJPROP_COLOR, Color_Trading_Session);
         }
      } // if(SM_7__Sess_RECT_or_VLINE==true) {
      if(SM_7__Sess_RECT_or_VLINE==false) {
         string       MyLine_Session_1 = "MyLine_VLINE_Start_"+Time_Trading_Session_Start;
         ObjectCreate(MyLine_Session_1, OBJ_VLINE, 0,  Time_Trading_Session_Start, 0);
         ObjectSet(   MyLine_Session_1, OBJPROP_STYLE, STYLE_SOLID);
         ObjectSet(   MyLine_Session_1, OBJPROP_WIDTH, 2);
         ObjectSet(   MyLine_Session_1, OBJPROP_BACK, True);
         ObjectSet(   MyLine_Session_1, OBJPROP_COLOR, LightSteelBlue);
         string       MyLine_Session_2 = "MyLine_VLINE_Start_"+Time_Trading_Session_End;
         ObjectCreate(MyLine_Session_2, OBJ_VLINE, 0,  Time_Trading_Session_End, 0);
         ObjectSet(   MyLine_Session_2, OBJPROP_STYLE, STYLE_SOLID);
         ObjectSet(   MyLine_Session_2, OBJPROP_WIDTH, 2);
         ObjectSet(   MyLine_Session_2, OBJPROP_BACK, True);
         ObjectSet(   MyLine_Session_2, OBJPROP_COLOR, LightSteelBlue);
      } // if(SM_7__Sess_RECT_or_VLINE==false) {
      WindowRedraw();
   }
} // void FUNCTION_SESSION_RECTANGLES() {

// EO SESSION RECTANGLES = TRADING HOURS BORDERS ---
// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
















// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// BUY/SELL STOP ---

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void FUNCTION_OPEN___BUYSTOP_SELLSTOP() {
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
// BUY STOP ---
//         if(Counter_OP_BUYSTOP<1   &&   Counter_OP_BUY<1   &&   ObjectFind(MyLine_Set_Stop_Buy)!=-1) {
   if(ObjectFind(MyLine_Set_Stop_Buy)!=-1) {
      if(MathMin(ObjectGet(MyLine_Set_Stop_Buy,OBJPROP_TIME1),ObjectGet(MyLine_Set_Stop_Buy,OBJPROP_TIME2))<=Time[0] ) {
         if(Ask<(MathMin(ObjectGet(MyLine_Set_Stop_Buy,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Stop_Buy,OBJPROP_PRICE2))-SM_8_Hard_Limit_StopLevel*PointX)   &&   MathMin(ObjectGet(MyLine_Set_Stop_Buy,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Stop_Buy,OBJPROP_PRICE2))>0.0 ) {
            FUNCTION_CALCULATE_SL();
            if(ObjectFind(MyLine_Set_SL)!=-1) {
               if(MathMin(ObjectGet(MyLine_Set_SL,OBJPROP_TIME1),ObjectGet(MyLine_Set_SL,OBJPROP_TIME2))<=Time[0] ) {
                  if(MathMax(ObjectGet(MyLine_Set_SL,OBJPROP_PRICE1),ObjectGet(MyLine_Set_SL,OBJPROP_PRICE2))<MathMin(ObjectGet(MyLine_Set_Stop_Buy,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Stop_Buy,OBJPROP_PRICE2))-SM_8_Hard_Limit_StopLevel*PointX   &&   MathMax(ObjectGet(MyLine_Set_SL,OBJPROP_PRICE1),ObjectGet(MyLine_Set_SL,OBJPROP_PRICE2))>0.0 ) {
                     SL_REAL    = (MathMin(ObjectGet(MyLine_Set_Stop_Buy,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Stop_Buy,OBJPROP_PRICE2)) - MathMax(ObjectGet(MyLine_Set_SL,OBJPROP_PRICE1),ObjectGet(MyLine_Set_SL,OBJPROP_PRICE2)) )  / PointX;
                     if(SL_REAL<SM_8_Hard_Limit_MIN_SL) {
                        SL_REAL = SM_8_Hard_Limit_MIN_SL;
                     }
                  }
               }
            }
            TP_REAL             = SM_1__TP_Fixed;
            if(SM_1_Mode_TP_INIT_Mult_SL==true) {
               TP_REAL          = SM_1_TP_INIT_Multiplier*SL_REAL + 2*(Ask-Bid)/PointX;
            }
            FUNCTION_MM_CHECKS_BUY();
            FUNCTION_OPEN_ORDER_BUY(MathMin(ObjectGet(MyLine_Set_Stop_Buy,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Stop_Buy,OBJPROP_PRICE2)), OP_BUYSTOP);
         } // if(Ask>=MathMin(ObjectGet(MyLine_Set_Stop_Buy,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Stop_Buy,OBJPROP_PRICE2))   &&   MathMin(ObjectGet(MyLine_Set_Stop_Buy,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Stop_Buy,OBJPROP_PRICE2))>0.0 ) {
      } // if(MathMin(ObjectGet(MyLine_Set_Stop_Buy,OBJPROP_TIME1),ObjectGet(MyLine_Set_Stop_Buy,OBJPROP_TIME2))<=Time[0] ) {
   } // if(ObjectFind(MyLine_Set_Stop_Buy)!=-1) {
// EO BUY STOP
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
// SELL STOP ---
//         if(Counter_OP_SELLSTOP<1   &&   Counter_OP_SELL<1   &&   ObjectFind(MyLine_Set_Stop_Sell)!=-1) {
   if(ObjectFind(MyLine_Set_Stop_Sell)!=-1) {
      if(MathMin(ObjectGet(MyLine_Set_Stop_Sell,OBJPROP_TIME1),ObjectGet(MyLine_Set_Stop_Sell,OBJPROP_TIME2))<=Time[0] ) {
         if(Bid>(MathMax(ObjectGet(MyLine_Set_Stop_Sell,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Stop_Sell,OBJPROP_PRICE2))+SM_8_Hard_Limit_StopLevel*PointX)   &&   MathMin(ObjectGet(MyLine_Set_Stop_Sell,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Stop_Sell,OBJPROP_PRICE2))>0.0 ) {
            FUNCTION_CALCULATE_SL();
            if(ObjectFind(MyLine_Set_SL)!=-1) {
               if(MathMin(ObjectGet(MyLine_Set_SL,OBJPROP_TIME1),ObjectGet(MyLine_Set_SL,OBJPROP_TIME2))<=Time[0] ) {
                  if(MathMin(ObjectGet(MyLine_Set_SL,OBJPROP_PRICE1),ObjectGet(MyLine_Set_SL,OBJPROP_PRICE2))>MathMax(ObjectGet(MyLine_Set_Stop_Sell,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Stop_Sell,OBJPROP_PRICE2))+SM_8_Hard_Limit_StopLevel*PointX   &&   MathMin(ObjectGet(MyLine_Set_SL,OBJPROP_PRICE1),ObjectGet(MyLine_Set_SL,OBJPROP_PRICE2))>0.0 ) {
                     SL_REAL    = (MathMin(ObjectGet(MyLine_Set_SL,OBJPROP_PRICE1),ObjectGet(MyLine_Set_SL,OBJPROP_PRICE2)) - MathMax(ObjectGet(MyLine_Set_Stop_Sell,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Stop_Sell,OBJPROP_PRICE2))) / PointX;
                     if(SL_REAL<SM_8_Hard_Limit_MIN_SL) {
                        SL_REAL = SM_8_Hard_Limit_MIN_SL;
                     }
                  }
               }
            }
            TP_REAL             = SM_1__TP_Fixed;
            if(SM_1_Mode_TP_INIT_Mult_SL==true) {
               TP_REAL          = SM_1_TP_INIT_Multiplier*SL_REAL + 2*(Ask-Bid)/PointX;
            }
            FUNCTION_MM_CHECKS_SELL();
            FUNCTION_OPEN_ORDER_SELL(MathMax(ObjectGet(MyLine_Set_Stop_Sell,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Stop_Sell,OBJPROP_PRICE2)), OP_SELLSTOP);
         } // if(Bid<=MathMax(ObjectGet(MyLine_Set_Stop_Sell,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Stop_Sell,OBJPROP_PRICE2))   &&   MathMax(ObjectGet(MyLine_Set_Stop_Sell,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Stop_Sell,OBJPROP_PRICE2))>0.0 ) {
      } // if(MathMin(ObjectGet(MyLine_Set_Stop_Sell,OBJPROP_TIME1),ObjectGet(MyLine_Set_Stop_Sell,OBJPROP_TIME2))<=Time[0] ) {
   } // if(ObjectFind(MyLine_Set_Stop_Sell)!=-1) {
// EO SELL STOP
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
} // void FUNCTION_OPEN___BUYSTOP_SELLSTOP() {

// EO BUY/SELL STOP ---
// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




















// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// BUY/SELL LIMIT ---

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void FUNCTION_OPEN___BUYLIMIT_SELLLIMIT() {
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
// BUY LIMIT ---
//         if(Counter_OP_BUYLIMIT<1   &&   Counter_OP_BUY<1   &&   ObjectFind(MyLine_Set_Limit_Buy)!=-1) {
   if(ObjectFind(MyLine_Set_Limit_Buy)!=-1) {
      if(MathMin(ObjectGet(MyLine_Set_Limit_Buy,OBJPROP_TIME1),ObjectGet(MyLine_Set_Limit_Buy,OBJPROP_TIME2))<=Time[0] ) {
         if(Bid>(MathMin(ObjectGet(MyLine_Set_Limit_Buy,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Limit_Buy,OBJPROP_PRICE2))+SM_8_Hard_Limit_StopLevel*PointX)   &&   MathMin(ObjectGet(MyLine_Set_Limit_Buy,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Limit_Buy,OBJPROP_PRICE2))>0.0 ) {
            FUNCTION_CALCULATE_SL();
            if(ObjectFind(MyLine_Set_SL)!=-1) {
               if(MathMin(ObjectGet(MyLine_Set_SL,OBJPROP_TIME1),ObjectGet(MyLine_Set_SL,OBJPROP_TIME2))<=Time[0] ) {
                  if(MathMax(ObjectGet(MyLine_Set_SL,OBJPROP_PRICE1),ObjectGet(MyLine_Set_SL,OBJPROP_PRICE2))<MathMin(ObjectGet(MyLine_Set_Limit_Buy,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Limit_Buy,OBJPROP_PRICE2))-SM_8_Hard_Limit_StopLevel*PointX   &&   MathMax(ObjectGet(MyLine_Set_SL,OBJPROP_PRICE1),ObjectGet(MyLine_Set_SL,OBJPROP_PRICE2))>0.0 ) {
                     SL_REAL    = (MathMin(ObjectGet(MyLine_Set_Limit_Buy,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Limit_Buy,OBJPROP_PRICE2)) - MathMax(ObjectGet(MyLine_Set_SL,OBJPROP_PRICE1),ObjectGet(MyLine_Set_SL,OBJPROP_PRICE2)) )  / PointX;
                     if(SL_REAL<SM_8_Hard_Limit_MIN_SL) {
                        SL_REAL = SM_8_Hard_Limit_MIN_SL;
                     }
                  }
               }
            }
            TP_REAL             = SM_1__TP_Fixed;
            if(SM_1_Mode_TP_INIT_Mult_SL==true) {
               TP_REAL          = SM_1_TP_INIT_Multiplier*SL_REAL + 2*(Ask-Bid)/PointX;
            }
            FUNCTION_MM_CHECKS_BUY();
            FUNCTION_OPEN_ORDER_BUY(MathMin(ObjectGet(MyLine_Set_Limit_Buy,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Limit_Buy,OBJPROP_PRICE2)), OP_BUYLIMIT);
         } // if(Ask>=MathMin(ObjectGet(MyLine_Set_Limit_Buy,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Limit_Buy,OBJPROP_PRICE2))   &&   MathMin(ObjectGet(MyLine_Set_Limit_Buy,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Limit_Buy,OBJPROP_PRICE2))>0.0 ) {
      } // if(MathMin(ObjectGet(MyLine_Set_Limit_Buy,OBJPROP_TIME1),ObjectGet(MyLine_Set_Limit_Buy,OBJPROP_TIME2))<=Time[0] ) {
   } // if(ObjectFind(MyLine_Set_Limit_Buy)!=-1) {
// EO BUY LIMIT
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
// SELL LIMIT ---
//         if(Counter_OP_SELLLIMIT<1   &&   Counter_OP_SELL<1   &&   ObjectFind(MyLine_Set_Limit_Sell)!=-1) {
   if(ObjectFind(MyLine_Set_Limit_Sell)!=-1) {
      if(MathMin(ObjectGet(MyLine_Set_Limit_Sell,OBJPROP_TIME1),ObjectGet(MyLine_Set_Limit_Sell,OBJPROP_TIME2))<=Time[0] ) {
         if(Ask<(MathMax(ObjectGet(MyLine_Set_Limit_Sell,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Limit_Sell,OBJPROP_PRICE2))-SM_8_Hard_Limit_StopLevel*PointX)   &&   MathMin(ObjectGet(MyLine_Set_Limit_Sell,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Limit_Sell,OBJPROP_PRICE2))>0.0 ) {
            FUNCTION_CALCULATE_SL();
            if(ObjectFind(MyLine_Set_SL)!=-1) {
               if(MathMin(ObjectGet(MyLine_Set_SL,OBJPROP_TIME1),ObjectGet(MyLine_Set_SL,OBJPROP_TIME2))<=Time[0] ) {
                  if(MathMin(ObjectGet(MyLine_Set_SL,OBJPROP_PRICE1),ObjectGet(MyLine_Set_SL,OBJPROP_PRICE2))>MathMax(ObjectGet(MyLine_Set_Limit_Sell,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Limit_Sell,OBJPROP_PRICE2))+SM_8_Hard_Limit_StopLevel*PointX   &&   MathMin(ObjectGet(MyLine_Set_SL,OBJPROP_PRICE1),ObjectGet(MyLine_Set_SL,OBJPROP_PRICE2))>0.0 ) {
                     SL_REAL    = (MathMin(ObjectGet(MyLine_Set_SL,OBJPROP_PRICE1),ObjectGet(MyLine_Set_SL,OBJPROP_PRICE2)) - MathMax(ObjectGet(MyLine_Set_Limit_Sell,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Limit_Sell,OBJPROP_PRICE2))) / PointX;
                     if(SL_REAL<SM_8_Hard_Limit_MIN_SL) {
                        SL_REAL = SM_8_Hard_Limit_MIN_SL;
                     }
                  }
               }
            }
            TP_REAL             = SM_1__TP_Fixed;
            if(SM_1_Mode_TP_INIT_Mult_SL==true) {
               TP_REAL          = SM_1_TP_INIT_Multiplier*SL_REAL + 2*(Ask-Bid)/PointX;
            }
            FUNCTION_MM_CHECKS_SELL();
            FUNCTION_OPEN_ORDER_SELL(MathMax(ObjectGet(MyLine_Set_Limit_Sell,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Limit_Sell,OBJPROP_PRICE2)), OP_SELLLIMIT);
         } // if(Bid<=MathMax(ObjectGet(MyLine_Set_Limit_Sell,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Limit_Sell,OBJPROP_PRICE2))   &&   MathMax(ObjectGet(MyLine_Set_Limit_Sell,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Limit_Sell,OBJPROP_PRICE2))>0.0 ) {
      } // if(MathMin(ObjectGet(MyLine_Set_Limit_Sell,OBJPROP_TIME1),ObjectGet(MyLine_Set_Limit_Sell,OBJPROP_TIME2))<=Time[0] ) {
   } // if(ObjectFind(MyLine_Set_Limit_Sell)!=-1) {
// EO SELL LIMIT
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
} // void FUNCTION_OPEN___BUYLIMIT_SELLLIMIT() {

// EO BUY/SELL LIMIT ---
// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++















// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// BUY/SELL MARKET (REAL) ---

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void FUNCTION_OPEN___BUYREAL_SELLREAL() {
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
// BUY REAL ---
//         if(Counter_OP_BUY<1) {
   bool Cond_Buy_REAL_LIMIT       = ObjectFind(MyLine_Set_Limit_Buy)!=-1   &&   MathMin(ObjectGet(MyLine_Set_Limit_Buy,OBJPROP_TIME1),ObjectGet(MyLine_Set_Limit_Buy,OBJPROP_TIME2))<=Time[0]   &&   MathMin(ObjectGet(MyLine_Set_Limit_Buy,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Limit_Buy,OBJPROP_PRICE2))>Ask   &&   MathMin(ObjectGet(MyLine_Set_Limit_Buy,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Limit_Buy,OBJPROP_PRICE2))>0.0;
   bool Cond_Buy_REAL_STOP        = ObjectFind(MyLine_Set_Stop_Buy)!=-1    &&   MathMin(ObjectGet(MyLine_Set_Stop_Buy,OBJPROP_TIME1),ObjectGet(MyLine_Set_Stop_Buy,OBJPROP_TIME2))<=Time[0]     &&   MathMin(ObjectGet(MyLine_Set_Stop_Buy,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Stop_Buy,OBJPROP_PRICE2))<Bid     &&   MathMin(ObjectGet(MyLine_Set_Stop_Buy,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Stop_Buy,OBJPROP_PRICE2))>0.0;
   if(Cond_Buy_REAL_LIMIT==true   ||   Cond_Buy_REAL_STOP==true ) {
      FUNCTION_CALCULATE_SL();
      if(ObjectFind(MyLine_Set_SL)!=-1) {
         if(MathMin(ObjectGet(MyLine_Set_SL,OBJPROP_TIME1),ObjectGet(MyLine_Set_SL,OBJPROP_TIME2))<=Time[0] ) {
            if(MathMax(ObjectGet(MyLine_Set_SL,OBJPROP_PRICE1),ObjectGet(MyLine_Set_SL,OBJPROP_PRICE2))>0.0 ) {
               SL_REAL            = (MathMin(ObjectGet(MyLine_Set_Limit_Buy,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Limit_Buy,OBJPROP_PRICE2)) - MathMax(ObjectGet(MyLine_Set_SL,OBJPROP_PRICE1),ObjectGet(MyLine_Set_SL,OBJPROP_PRICE2)) )  / PointX;
               if(SL_REAL<SM_8_Hard_Limit_MIN_SL) {
                  SL_REAL         = SM_8_Hard_Limit_MIN_SL;
               }
            }
         }
      }
      TP_REAL                     = SM_1__TP_Fixed;
      if(SM_1_Mode_TP_INIT_Mult_SL==true) {
         TP_REAL                  = SM_1_TP_INIT_Multiplier*SL_REAL + 2*(Ask-Bid)/PointX;
      }
      FUNCTION_MM_CHECKS_BUY();
      FUNCTION_OPEN_ORDER_BUY(Ask, OP_BUY);
   } // if(Cond_Buy_REAL_LIMIT==true   ||   Cond_Buy_REAL_STOP==true ) {
//         } // if(Counter_OP_BUYLIMIT<1   &&   Counter_OP_BUYSTOP<1   &&   Counter_OP_BUY<1) {
// EO BUY REAL
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
// SELL REAL ---
//         if(Counter_OP_SELL<1) {
   bool Cond_Sell_REAL_LIMIT      = ObjectFind(MyLine_Set_Limit_Sell)!=-1   &&   MathMin(ObjectGet(MyLine_Set_Limit_Sell,OBJPROP_TIME1),ObjectGet(MyLine_Set_Limit_Sell,OBJPROP_TIME2))<=Time[0]   &&   MathMax(ObjectGet(MyLine_Set_Limit_Sell,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Limit_Sell,OBJPROP_PRICE2))<Bid   &&   MathMin(ObjectGet(MyLine_Set_Limit_Sell,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Limit_Sell,OBJPROP_PRICE2))>0.0;
   bool Cond_Sell_REAL_STOP       = ObjectFind(MyLine_Set_Stop_Sell)!=-1    &&   MathMin(ObjectGet(MyLine_Set_Stop_Sell,OBJPROP_TIME1),ObjectGet(MyLine_Set_Stop_Sell,OBJPROP_TIME2))<=Time[0]     &&   MathMax(ObjectGet(MyLine_Set_Stop_Sell,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Stop_Sell,OBJPROP_PRICE2))>Ask     &&   MathMin(ObjectGet(MyLine_Set_Stop_Sell,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Stop_Sell,OBJPROP_PRICE2))>0.0;
   if(Cond_Sell_REAL_LIMIT==true   ||   Cond_Sell_REAL_STOP==true ) {
      FUNCTION_CALCULATE_SL();
      if(ObjectFind(MyLine_Set_SL)!=-1) {
         if(MathMin(ObjectGet(MyLine_Set_SL,OBJPROP_TIME1),ObjectGet(MyLine_Set_SL,OBJPROP_TIME2))<=Time[0] ) {
            if(MathMin(ObjectGet(MyLine_Set_SL,OBJPROP_PRICE1),ObjectGet(MyLine_Set_SL,OBJPROP_PRICE2))>0.0 ) {
               SL_REAL            = (MathMin(ObjectGet(MyLine_Set_SL,OBJPROP_PRICE1),ObjectGet(MyLine_Set_SL,OBJPROP_PRICE2)) - MathMax(ObjectGet(MyLine_Set_Limit_Sell,OBJPROP_PRICE1),ObjectGet(MyLine_Set_Limit_Sell,OBJPROP_PRICE2))) / PointX;
               if(SL_REAL<SM_8_Hard_Limit_MIN_SL) {
                  SL_REAL         = SM_8_Hard_Limit_MIN_SL;
               }
            }
         }
      }
      TP_REAL                     = SM_1__TP_Fixed;
      if(SM_1_Mode_TP_INIT_Mult_SL==true) {
         TP_REAL                  = SM_1_TP_INIT_Multiplier*SL_REAL + 2*(Ask-Bid)/PointX;
      }
      FUNCTION_MM_CHECKS_SELL();
      FUNCTION_OPEN_ORDER_SELL(Bid, OP_SELL);
   } // if(Cond_Sell_REAL_LIMIT==true   ||   Cond_Sell_REAL_STOP==true ) {
//         } // if(ObjectFind(MyLine_Set_Limit_Sell)!=-1) {
// EO SELL REAL
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
} // void FUNCTION_OPEN___BUYREAL_SELLREAL() {

// EO BUY/SELL MARKET (REAL) ---
// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++















// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// DELETE HLINES ---

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void FUNCTION_DELETE_HLINES() {
// IF THERE ARE HLINES WITHOUT CORRESPONDING ORDERS (DELETED) ===>>> DELETE HLINES
// if(Orders_HIST_Total___HLINES!=OrdersHistoryTotal()) {
//    Orders_HIST_Total___HLINES         = OrdersHistoryTotal();
   for(int cnt_11=OrdersHistoryTotal(); cnt_11>=OrdersHistoryTotal()-20; cnt_11--) {
      if(OrderSelect(cnt_11, SELECT_BY_POS, MODE_HISTORY)==true) {
         if(ObjectFind(  MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0))!=-1   ||   ObjectFind(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0))!=-1   ||   ObjectFind(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0))!=-1 ) {
            ObjectDelete(MyLine_HLINE_TP+DoubleToStr(OrderTicket(),0));
            ObjectDelete(MyLine_HLINE_SL+DoubleToStr(OrderTicket(),0));
            ObjectDelete(MyLine_HLINE_OP+DoubleToStr(OrderTicket(),0));
         }
         ObjectDelete("Buy__R"+"___#"+DoubleToStr(OrderTicket(),0));
         ObjectDelete("Buy__R"+"___#"+DoubleToStr(OrderTicket(),0)+"___Profit");
         ObjectDelete("Buy__R"+"___#"+DoubleToStr(OrderTicket(),0)+"___TP");
         ObjectDelete("Buy__R"+"___#"+DoubleToStr(OrderTicket(),0)+"___SL");
         ObjectDelete("Sell_R"+"___#"+DoubleToStr(OrderTicket(),0));
         ObjectDelete("Sell_R"+"___#"+DoubleToStr(OrderTicket(),0)+"___Profit");
         ObjectDelete("Sell_R"+"___#"+DoubleToStr(OrderTicket(),0)+"___TP");
         ObjectDelete("Sell_R"+"___#"+DoubleToStr(OrderTicket(),0)+"___SL");
         ObjectDelete("Buy__L"+"___#"+DoubleToStr(OrderTicket(),0));
         ObjectDelete("Buy__L"+"___#"+DoubleToStr(OrderTicket(),0)+"___Profit");
         ObjectDelete("Buy__L"+"___#"+DoubleToStr(OrderTicket(),0)+"___TP");
         ObjectDelete("Buy__L"+"___#"+DoubleToStr(OrderTicket(),0)+"___SL");
         ObjectDelete("Sell_L"+"___#"+DoubleToStr(OrderTicket(),0));
         ObjectDelete("Sell_L"+"___#"+DoubleToStr(OrderTicket(),0)+"___Profit");
         ObjectDelete("Sell_L"+"___#"+DoubleToStr(OrderTicket(),0)+"___TP");
         ObjectDelete("Sell_L"+"___#"+DoubleToStr(OrderTicket(),0)+"___SL");
         ObjectDelete("Buy__S"+"___#"+DoubleToStr(OrderTicket(),0));
         ObjectDelete("Buy__S"+"___#"+DoubleToStr(OrderTicket(),0)+"___Profit");
         ObjectDelete("Buy__S"+"___#"+DoubleToStr(OrderTicket(),0)+"___TP");
         ObjectDelete("Buy__S"+"___#"+DoubleToStr(OrderTicket(),0)+"___SL");
         ObjectDelete("Sell_S"+"___#"+DoubleToStr(OrderTicket(),0));
         ObjectDelete("Sell_S"+"___#"+DoubleToStr(OrderTicket(),0)+"___Profit");
         ObjectDelete("Sell_S"+"___#"+DoubleToStr(OrderTicket(),0)+"___TP");
         ObjectDelete("Sell_S"+"___#"+DoubleToStr(OrderTicket(),0)+"___SL");
      } // if(OrderSelect(cnt_11, SELECT_BY_POS, MODE_HISTORY)==true) {
   } // for(int cnt_11=OrdersHistoryTotal(); cnt_11>=OrdersHistoryTotal()-20; cnt_11--) {
// } // if(Orders_HIST_Total___HLINES!=OrdersHistoryTotal()) {
// EO IF THERE ARE HLINES WITHOUT CORRESPONDING ORDERS (DELETED) ===>>> DELETE HLINES
   for(int cnt_14=OrdersTotal()-1; cnt_14>=0; cnt_14--) {
      if(OrderSelect(cnt_14, SELECT_BY_POS, MODE_TRADES)==true) {
         ObjectDelete("Buy__R"+"___#"+DoubleToStr(OrderTicket(),0));
         ObjectDelete("Buy__R"+"___#"+DoubleToStr(OrderTicket(),0)+"___Profit");
         ObjectDelete("Buy__R"+"___#"+DoubleToStr(OrderTicket(),0)+"___TP");
         ObjectDelete("Buy__R"+"___#"+DoubleToStr(OrderTicket(),0)+"___SL");
         ObjectDelete("Sell_R"+"___#"+DoubleToStr(OrderTicket(),0));
         ObjectDelete("Sell_R"+"___#"+DoubleToStr(OrderTicket(),0)+"___Profit");
         ObjectDelete("Sell_R"+"___#"+DoubleToStr(OrderTicket(),0)+"___TP");
         ObjectDelete("Sell_R"+"___#"+DoubleToStr(OrderTicket(),0)+"___SL");
         ObjectDelete("Buy__L"+"___#"+DoubleToStr(OrderTicket(),0));
         ObjectDelete("Buy__L"+"___#"+DoubleToStr(OrderTicket(),0)+"___Profit");
         ObjectDelete("Buy__L"+"___#"+DoubleToStr(OrderTicket(),0)+"___TP");
         ObjectDelete("Buy__L"+"___#"+DoubleToStr(OrderTicket(),0)+"___SL");
         ObjectDelete("Sell_L"+"___#"+DoubleToStr(OrderTicket(),0));
         ObjectDelete("Sell_L"+"___#"+DoubleToStr(OrderTicket(),0)+"___Profit");
         ObjectDelete("Sell_L"+"___#"+DoubleToStr(OrderTicket(),0)+"___TP");
         ObjectDelete("Sell_L"+"___#"+DoubleToStr(OrderTicket(),0)+"___SL");
         ObjectDelete("Buy__S"+"___#"+DoubleToStr(OrderTicket(),0));
         ObjectDelete("Buy__S"+"___#"+DoubleToStr(OrderTicket(),0)+"___Profit");
         ObjectDelete("Buy__S"+"___#"+DoubleToStr(OrderTicket(),0)+"___TP");
         ObjectDelete("Buy__S"+"___#"+DoubleToStr(OrderTicket(),0)+"___SL");
         ObjectDelete("Sell_S"+"___#"+DoubleToStr(OrderTicket(),0));
         ObjectDelete("Sell_S"+"___#"+DoubleToStr(OrderTicket(),0)+"___Profit");
         ObjectDelete("Sell_S"+"___#"+DoubleToStr(OrderTicket(),0)+"___TP");
         ObjectDelete("Sell_S"+"___#"+DoubleToStr(OrderTicket(),0)+"___SL");
      } // if(OrderSelect(cnt_11, SELECT_BY_POS, MODE_HISTORY)==true) {
   } // for(int cnt_11=OrdersHistoryTotal(); cnt_11>=OrdersHistoryTotal()-20; cnt_11--) {
} // void FUNCTION_DELETE_HLINES() {

// EO DELETE HLINES ---
// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++













// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// SHOW_INFO_ON_SCREEN ---

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void FUNCTION_SHOW_INFO_ON_SCREEN() {
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
// SHOW INFO ---
   ObjectCreate( "My_TxtObj_TL1", OBJ_LABEL,          0, 0, 0);
   ObjectSet(    "My_TxtObj_TL1", OBJPROP_CORNER,     3);
   ObjectSet(    "My_TxtObj_TL1", OBJPROP_XDISTANCE,  75);
   ObjectSet(    "My_TxtObj_TL1", OBJPROP_YDISTANCE,  25);
   ObjectSetText("My_TxtObj_TL1", "TimeLeft:", Text_Font_Size, Text_Font, Text_Color);
   datetime TimeLeft = (Time[0] + (Period() * 60) - Current_Time) / 60;
   ObjectCreate( "My_TxtObj_TL2", OBJ_LABEL,          0, 0, 0);
   ObjectSet(    "My_TxtObj_TL2", OBJPROP_CORNER,     3);
   ObjectSet(    "My_TxtObj_TL2", OBJPROP_XDISTANCE,  10);
   ObjectSet(    "My_TxtObj_TL2", OBJPROP_YDISTANCE,  25);
   ObjectSetText("My_TxtObj_TL2", DoubleToStr(TimeLeft, 0), Text_Font_Size, Text_Font, Text_Color);
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
   ObjectCreate( "My_TxtObj_ADR1", OBJ_LABEL,          0, 0, 0);
   ObjectSet(    "My_TxtObj_ADR1", OBJPROP_CORNER,     3);
   ObjectSet(    "My_TxtObj_ADR1", OBJPROP_XDISTANCE,  130);
   ObjectSet(    "My_TxtObj_ADR1", OBJPROP_YDISTANCE,  5);
   ObjectSetText("My_TxtObj_ADR1", "ADR:", Text_Font_Size, Text_Font, Text_Color);
   ObjectCreate( "My_TxtObj_ADR2", OBJ_LABEL,          0, 0, 0);
   ObjectSet(    "My_TxtObj_ADR2", OBJPROP_CORNER,     3);
   ObjectSet(    "My_TxtObj_ADR2", OBJPROP_XDISTANCE,  10);
   ObjectSet(    "My_TxtObj_ADR2", OBJPROP_YDISTANCE,  5);
   ObjectSetText("My_TxtObj_ADR2", DoubleToStr(iATR(NULL,PERIOD_D1,SM_9_Period_ADR,1)/PointX, 0)+" <> "+DoubleToStr(iATR(NULL,PERIOD_D1,1,0)/PointX, 0), Text_Font_Size, Text_Font, Text_Color);
   if(SM_2__Mode_SL==0   &&   PointX>0.0) {
      SL_ATR_Show    = MathRound((SM_2___SL__ADR_Multiplier*(iATR(Symbol(), PERIOD_D1, SM_2___SL__ADR_Period, 1))) / PointX);
      if(SL_ATR_Show>0) {
         ObjectCreate( "SL_ATR",      OBJ_LABEL,          0, 0, 0);
         ObjectSet(    "SL_ATR",      OBJPROP_CORNER,     3);
         ObjectSet(    "SL_ATR",      OBJPROP_XDISTANCE,  190);
         ObjectSet(    "SL_ATR",      OBJPROP_YDISTANCE,  5);
         ObjectSetText("SL_ATR",      DoubleToStr(SL_ATR_Show,0), Text_Font_Size, Text_Font, SteelBlue);
      }
   }
   if(SM_2__Mode_SL!=0) {
      if(ObjectFind("SL_ATR")!=-1) {
         ObjectDelete("SL_ATR");
      }
   }
// EO SHOW INFO ---
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
} // void FUNCTION_SHOW_INFO_ON_SCREEN() {

// EO SHOW_INFO_ON_SCREEN ---
// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++















// Array_CLSD_TimeOpen[][9]              // CLOSED ORDERS WITH REAL TRADES SORTED BY TIMEOPEN
// 0 TimeOpen      OrderOpenTime
// 1 PriceOpen     OrderOpenPrice
// 2 TimeClose     OrderCloseTime
// 3 PriceClose    OrderClosePrice
// 4 OrderType     OrderType
// 5 SL            OrderStopLoss
// 6 TP            OrderTakeProfit
// 7 Lots          OrderLots
// 8 OrderProfit   OrderProfit



// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// CREATE ARRAY WITH CLOSED REAL TRADES

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void FUNCTION_CREATE_ARRAY_REAL() {
   int Counter_clsd                                    = 0;
   for(int cnt_clsd=OrdersHistoryTotal()-1; cnt_clsd>=0; cnt_clsd--) {        // Fill Array with Data
      if(OrderSelect(cnt_clsd, SELECT_BY_POS, MODE_HISTORY)==true) {
         if(OrderSymbol()==Symbol()   &&   (OrderType()==OP_BUY   ||   OrderType()==OP_SELL)   &&   OrderCloseTime()!=0   &&   OrderMagicNumber()==My_Magic_Number ) {
            Counter_clsd                               = Counter_clsd + 1;
            ArrayResize(Array_CLSD_TimeOpen,    Counter_clsd);
            Array_CLSD_TimeOpen[Counter_clsd-1][0]     = OrderOpenTime();
            Array_CLSD_TimeOpen[Counter_clsd-1][1]     = OrderOpenPrice();
            Array_CLSD_TimeOpen[Counter_clsd-1][2]     = OrderCloseTime();
            Array_CLSD_TimeOpen[Counter_clsd-1][3]     = OrderClosePrice();
            Array_CLSD_TimeOpen[Counter_clsd-1][4]     = OrderType();
            Array_CLSD_TimeOpen[Counter_clsd-1][5]     = OrderStopLoss();
            Array_CLSD_TimeOpen[Counter_clsd-1][6]     = OrderTakeProfit();
            Array_CLSD_TimeOpen[Counter_clsd-1][7]     = OrderLots();
            Array_CLSD_TimeOpen[Counter_clsd-1][8]     = OrderProfit();
         } // if(OrderSymbol()==Symbol()   &&   (OrderType()==OP_BUY   ||   OrderType()==OP_SELL)   &&   OrderCloseTime()!=0   &&   OrderMagicNumber()==My_Magic_Number ) {
      } // if(OrderSelect(cnt_clsd, SELECT_BY_TICKET)==true) {
   } // for(int cnt_clsd=OrdersHistoryTotal()-1; cnt_clsd>=0; cnt_clsd--) {
   if(ArrayRange(Array_CLSD_TimeOpen,0)>=2) {
      ArraySort(Array_CLSD_TimeOpen,WHOLE_ARRAY,0,MODE_ASCEND);
      //Print("\n ========================== ");
      //Print("Array_CLSD_TimeOpen[0][0] TO = ", Array_CLSD_TimeOpen[0][0]);
      //Print("Array_CLSD_TimeOpen[0][1] PO = ", Array_CLSD_TimeOpen[0][1]);
      //Print("Array_CLSD_TimeOpen[0][2] TC = ", Array_CLSD_TimeOpen[0][2]);
      //Print("Array_CLSD_TimeOpen[0][3] PC = ", Array_CLSD_TimeOpen[0][3]);
      //Print("Array_CLSD_TimeOpen[0][4] TY = ", Array_CLSD_TimeOpen[0][4]);
      //Print("Array_CLSD_TimeOpen[0][5] SL = ", Array_CLSD_TimeOpen[0][5]);
      //Print("Array_CLSD_TimeOpen[0][6] TP = ", Array_CLSD_TimeOpen[0][6]);
      //Print("Array_CLSD_TimeOpen[0][7] LT = ", Array_CLSD_TimeOpen[0][7]);
      //Print("Array_CLSD_TimeOpen[0][8] PR = ", Array_CLSD_TimeOpen[0][8]);
      //Print("\n = ");
      //Print("Array_CLSD_TimeOpen[1][0] TO = ", Array_CLSD_TimeOpen[1][0]);
      //Print("Array_CLSD_TimeOpen[1][1] PO = ", Array_CLSD_TimeOpen[1][1]);
      //Print("Array_CLSD_TimeOpen[1][2] TC = ", Array_CLSD_TimeOpen[1][2]);
      //Print("Array_CLSD_TimeOpen[1][3] PC = ", Array_CLSD_TimeOpen[1][3]);
      //Print("Array_CLSD_TimeOpen[1][4] TY = ", Array_CLSD_TimeOpen[1][4]);
      //Print("Array_CLSD_TimeOpen[1][5] SL = ", Array_CLSD_TimeOpen[1][5]);
      //Print("Array_CLSD_TimeOpen[1][6] TP = ", Array_CLSD_TimeOpen[1][6]);
      //Print("Array_CLSD_TimeOpen[1][7] LT = ", Array_CLSD_TimeOpen[1][7]);
      //Print("Array_CLSD_TimeOpen[1][8] PR = ", Array_CLSD_TimeOpen[1][8]);
      //Print("\n ========================== ");
   } // if(ArrayRange(Array_CLSD_TimeOpen,0)>=2) {
   for(int j=0; j<ArrayRange(Array_CLSD_TimeOpen,0); j++) {
      Print("========================== ");
      Print("ORDER # ", (j+1));                    // Here order number is after cleaning array from all pending orders => number here is differs from what we had on the chart
      Print("Array_CLSD_TimeOpen[",j,"][0] TO = ", Array_CLSD_TimeOpen[j][0]);
      Print("Array_CLSD_TimeOpen[",j,"][1] PO = ", Array_CLSD_TimeOpen[j][1]);
      Print("Array_CLSD_TimeOpen[",j,"][2] TC = ", Array_CLSD_TimeOpen[j][2]);
      Print("Array_CLSD_TimeOpen[",j,"][3] PC = ", Array_CLSD_TimeOpen[j][3]);
      Print("Array_CLSD_TimeOpen[",j,"][4] TY = ", Array_CLSD_TimeOpen[j][4]);
      Print("Array_CLSD_TimeOpen[",j,"][5] SL = ", Array_CLSD_TimeOpen[j][5]);
      Print("Array_CLSD_TimeOpen[",j,"][6] TP = ", Array_CLSD_TimeOpen[j][6]);
      Print("Array_CLSD_TimeOpen[",j,"][7] LT = ", Array_CLSD_TimeOpen[j][7]);
      Print("Array_CLSD_TimeOpen[",j,"][8] PR = ", Array_CLSD_TimeOpen[j][8]);
      Print("");
   }
} // void FUNCTION_CREATE_ARRAY_REAL() {


// EO CREATE ARRAY WITH CLOSED REAL TRADES
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++













// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// SAVE ARRAY DATA TO FILE

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void FUNCTION_SAVE_ARRAY2FILE(double &ARRAY_INPUT_DATA[][]) {
   if(_IsOptimization==false) {
      string File_ARRAY_Name            = "Files_X\\_ARRAY_SIMULATOR_ORDERS_FILE_"+"_"+Symbol()+".bin";
      int File_ARRAY_Handle             = FileOpen(File_ARRAY_Name,  FILE_BIN|FILE_WRITE);      // FILE_BIN - This is Binary FILE
      if(File_ARRAY_Handle==-1) {                                                  // FILE NOT FOUND ===>>> GENERATING NEW FILE
         Print("-------------- ERROR:   File "+File_ARRAY_Name+" cannot be Created. EA STOPPED!", GetLastError());
         return;
      }
      if(File_ARRAY_Handle!=-1) {                                                  // FILE FOUND ===>>> READING INPUTS FROM PREVIOUSLY SAVED FILE
         int FileWriteArray_Handle      = -1;
         FileWriteArray_Handle          = FileWriteArray(File_ARRAY_Handle, ARRAY_INPUT_DATA, 0,ArraySize(ARRAY_INPUT_DATA) );             // ArraySize(), not ArrayRange()
         if(FileWriteArray_Handle<0) {
            Print("");
            Print("-------------- ERROR FileWriteArray!!!  FILE ["+File_ARRAY_Name+"] cannot be created from ARRAY [ARRAY_INPUT_DATA]!!!", GetLastError());
            Print("");
            return;
         } else {
            Print("");
            Print("-------------- FileWriteArray finished successfully! FILE ["+File_ARRAY_Name+"] was created from ARRAY [ARRAY_INPUT_DATA]!!!");
            Print("");
         }
         FileClose(File_ARRAY_Handle);
      } // if(File_ARRAY_Handle==-1) {
   } // if(_IsOptimization==false) {
} // FUNCTION_SAVE_ARRAY2FILE()

// SAVE ARRAY DATA TO FILE
// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++





















//// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//// Delete SET_ TLINEs when passing through WEEKENDS
//
//void FUNC_DEL_TLINES_WEEKENDS() {
//
//Print("");
//Print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
//Print("Time[0] = ", Time[0] );
//Print("Time[1] = ", Time[1] );
//Print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
//
////      if(MathAbs(iTime(NULL,0,0)-iTime(NULL,0,1) )>Period()*60) {
//      if(MathAbs(Time[0]-Time[1] )>Period()*60) {
//         ObjectDelete(MyLine_Set_Stop_Buy);
//         ObjectDelete(MyLine_Set_Stop_Sell);
//         ObjectDelete(MyLine_Set_Limit_Buy);
//         ObjectDelete(MyLine_Set_Limit_Sell);
//         ObjectDelete(MyLine_Set_SL);
////Print("");
////Print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
//////Print("BINGO!!!  TLINES WERE DELETED!!!");
//////Print("DELTA BARS = ", (MathAbs(iTime(NULL,0,0)-iTime(NULL,0,1) ))/60  );
//////Print("DELTA BARS = ", iBarShift(NULL, 0, Time[1])  );
//////Print("iTime(NULL,0,0) = ", iTime(NULL,0,0) );
//////Print("iTime(NULL,0,1) = ", iTime(NULL,0,1) );
////Print("Time[0] = ", Time[0] );
////Print("Time[1] = ", Time[1] );
//////Print("TimeToStr(Time[0]) = ", TimeToStr(Time[0]) );
//////Print("TimeToStr(Time[1]) = ", TimeToStr(Time[1]) );
//////Print("DELTA BARS = ", (MathAbs(Time[0]-Time[1] )/(Period()*60))  );
////Print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
//      }
//
//} // FUNC_DEL_TLINES_WEEKENDS()
//
//// Delete SET_ TLINEs when passing through WEEKENDS
//// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
















// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// DRAW_TLINES

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void FUNCTION_DRAW_TLINES() {
   if(Mode_Order_Confirm!="< OFF >") {
      return;
   }
//int Dist_From_TIME_0            = 15;   // For STOP_TLINEs
//int Dist_From_STOPs             = 15;   // For LIMIT_TLINEs
//int Dist_From_STOPs_SL          =  8;   // For STOPLOSS_TLINE
//int Bars_Length_TLINEs             = 10;
//int    Dist_From_TIME_0         = 30;   // For STOP_TLINEs
//int    Dist_From_STOPs          = 15;   // For LIMIT_TLINEs
//int    Dist_From_STOPs_SL       =  8;   // For STOPLOSS_TLINE
//int    Bars_Length_TLINEs      = 10;   // Horizontal length of TLINEs
//double Price_Delta_TLINEs       = 10;   // Vertical Distance between TLINEs
   int    Dist_From_TIME_0         = 45;   // For STOP_TLINEs
//      int    Dist_From_STOPs          = 15;   // For LIMIT_TLINEs
//      int    Dist_From_STOPs_SL       =  8;   // For STOPLOSS_TLINE
   int    Bars_Length_TLINEs       = 10;   // Horizontal length of TLINEs
   double Price_Delta_TLINEs       = 5;   // Vertical Distance between TLINEs
//   // ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
//   // Calculate Coordinates for SET_ STOP/LIMIT/SL TLINEs - These lines needed for OPENING NEW ORDERS
//      datetime Time_TLINE_STOP_Left   = Time[0]               + Period()*60*Dist_From_TIME_0;
//      datetime Time_TLINE_STOP_Right  = Time_TLINE_STOP_Left  + Period()*60*Bars_Length_TLINEs;
//
//      datetime Time_TLINE_LIMIT_Left  = Time_TLINE_STOP_Left  + Period()*60*Dist_From_STOPs;
//      datetime Time_TLINE_LIMIT_Right = Time_TLINE_LIMIT_Left + Period()*60*Bars_Length_TLINEs;
//
//      datetime Time_TLINE_SL_Left     = Time_TLINE_STOP_Left  + Period()*60*Dist_From_STOPs_SL;
//      datetime Time_TLINE_SL_Right    = Time_TLINE_SL_Left    + Period()*60*Bars_Length_TLINEs;
//
//      double   Coordinate_TLINE       = WindowPriceMin()      + (WindowPriceMax()-WindowPriceMin())/2;
//   // EO Calculate Coordinates for SET_ STOP/LIMIT/SL TLINEs - These lines needed for OPENING NEW ORDERS
//   // ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
// Calculate Coordinates for SET_ STOP/LIMIT/SL TLINEs - These lines needed for OPENING NEW ORDERS
   datetime Time_TLINE_STOP_Left   = Time[0]               + Period()*60*Dist_From_TIME_0;
   datetime Time_TLINE_STOP_Right  = Time_TLINE_STOP_Left  + Period()*60*Bars_Length_TLINEs;
   datetime Time_TLINE_LIMIT_Left  = Time_TLINE_STOP_Left;
   datetime Time_TLINE_LIMIT_Right = Time_TLINE_STOP_Right;
   datetime Time_TLINE_SL_Left     = Time_TLINE_STOP_Left;
   datetime Time_TLINE_SL_Right    = Time_TLINE_STOP_Right;
   double   Coordinate_TLINE       = WindowPriceMin()      + (WindowPriceMax()-WindowPriceMin())/2;
// EO Calculate Coordinates for SET_ STOP/LIMIT/SL TLINEs - These lines needed for OPENING NEW ORDERS
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
// If new Bar created, then need to delete previous SET_ STOP/LIMIT/SL UNUSED TLINES and recreate them again
   if(ObjectFind(MyLine_Set_Stop_Buy)!=-1     &&   MathMin(ObjectGet(MyLine_Set_Stop_Buy,OBJPROP_TIME1),ObjectGet(MyLine_Set_Stop_Buy,OBJPROP_TIME2))>Time[0]     &&   ObjectGet(MyLine_Set_Stop_Buy,OBJPROP_TIME1)!=Time_TLINE_STOP_Left ) {
      ObjectDelete(MyLine_Set_Stop_Buy);
   }
   if(ObjectFind(MyLine_Set_Stop_Sell)!=-1    &&   MathMin(ObjectGet(MyLine_Set_Stop_Sell,OBJPROP_TIME1),ObjectGet(MyLine_Set_Stop_Sell,OBJPROP_TIME2))>Time[0]   &&   ObjectGet(MyLine_Set_Stop_Sell,OBJPROP_TIME1)!=Time_TLINE_STOP_Left ) {
      ObjectDelete(MyLine_Set_Stop_Sell);
   }
   if(ObjectFind(MyLine_Set_Limit_Buy)!=-1    &&   MathMin(ObjectGet(MyLine_Set_Limit_Buy,OBJPROP_TIME1),ObjectGet(MyLine_Set_Limit_Buy,OBJPROP_TIME2))>Time[0]     &&   ObjectGet(MyLine_Set_Limit_Buy,OBJPROP_TIME1)!=Time_TLINE_LIMIT_Left ) {
      ObjectDelete(MyLine_Set_Limit_Buy);
   }
   if(ObjectFind(MyLine_Set_Limit_Sell)!=-1   &&   MathMin(ObjectGet(MyLine_Set_Limit_Sell,OBJPROP_TIME1),ObjectGet(MyLine_Set_Limit_Sell,OBJPROP_TIME2))>Time[0]   &&   ObjectGet(MyLine_Set_Limit_Sell,OBJPROP_TIME1)!=Time_TLINE_LIMIT_Left ) {
      ObjectDelete(MyLine_Set_Limit_Sell);
   }
   if(ObjectFind(MyLine_Set_SL)!=-1           &&   MathMin(ObjectGet(MyLine_Set_SL,OBJPROP_TIME1),ObjectGet(MyLine_Set_SL,OBJPROP_TIME2))>Time[0]     &&   ObjectGet(MyLine_Set_SL,OBJPROP_TIME1)!=Time_TLINE_SL_Left ) {
      ObjectDelete(MyLine_Set_SL);
   }
// EO If new Bar created, then need to delete previous SET_ STOP/LIMIT/SL UNUSED TLINES and recreate them again
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
// Delete SET_ TLINEs when passing through WEEKENDS
//if(MathAbs(iTime(NULL,0,0)-iTime(NULL,0,1) )>Period()*60) {
   if(MathAbs(Time[0]-Time[1] )>Period()*60) {
      ObjectDelete(MyLine_Set_Stop_Buy);
      ObjectDelete(MyLine_Set_Stop_Sell);
      ObjectDelete(MyLine_Set_Limit_Buy);
      ObjectDelete(MyLine_Set_Limit_Sell);
      ObjectDelete(MyLine_Set_SL);
   }
// EO Delete SET_ TLINEs when passing through WEEKENDS
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
//// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
//// DRAW SET_ STOP/LIMIT/SL TLINEs - These lines needed for OPENING NEW ORDERS
//   FUNCTION_DRAW_NEW_TLINE(Time_TLINE_STOP_Left,  Time_TLINE_STOP_Right,  Coordinate_TLINE,           MyLine_Set_Stop_Buy,   Color_Only_Buy);
//   FUNCTION_DRAW_NEW_TLINE(Time_TLINE_STOP_Left,  Time_TLINE_STOP_Right,  Coordinate_TLINE-10*PointX, MyLine_Set_Stop_Sell,  Color_Only_Sell);
//   FUNCTION_DRAW_NEW_TLINE(Time_TLINE_LIMIT_Left, Time_TLINE_LIMIT_Right, Coordinate_TLINE-10*PointX, MyLine_Set_Limit_Buy,  Color_Only_Buy);
//   FUNCTION_DRAW_NEW_TLINE(Time_TLINE_LIMIT_Left, Time_TLINE_LIMIT_Right, Coordinate_TLINE,           MyLine_Set_Limit_Sell, Color_Only_Sell);
//   FUNCTION_DRAW_NEW_TLINE(Time_TLINE_SL_Left,    Time_TLINE_SL_Right,    Coordinate_TLINE-5*PointX,  MyLine_Set_SL,         Blue);
//// EO DRAW SET_ STOP/LIMIT/SL TLINEs - These lines needed for OPENING NEW ORDERS
//// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
// DRAW SET_ STOP/LIMIT/SL TLINEs - These lines needed for OPENING NEW ORDERS
   FUNCTION_DRAW_NEW_TLINE(Time_TLINE_STOP_Left,  Time_TLINE_STOP_Right,  Coordinate_TLINE, MyLine_Set_Stop_Buy,   Color_Only_Buy);
   FUNCTION_DRAW_NEW_TLINE(Time_TLINE_LIMIT_Left, Time_TLINE_LIMIT_Right, Coordinate_TLINE - PointX*Price_Delta_TLINEs*1, MyLine_Set_Limit_Sell, Color_Only_Sell);
   FUNCTION_DRAW_NEW_TLINE(Time_TLINE_SL_Left,    Time_TLINE_SL_Right,    Coordinate_TLINE - PointX*Price_Delta_TLINEs*2, MyLine_Set_SL,         Blue);
   FUNCTION_DRAW_NEW_TLINE(Time_TLINE_LIMIT_Left, Time_TLINE_LIMIT_Right, Coordinate_TLINE - PointX*Price_Delta_TLINEs*3, MyLine_Set_Limit_Buy,  Color_Only_Buy);
   FUNCTION_DRAW_NEW_TLINE(Time_TLINE_STOP_Left,  Time_TLINE_STOP_Right,  Coordinate_TLINE - PointX*Price_Delta_TLINEs*4, MyLine_Set_Stop_Sell,  Color_Only_Sell);
// EO DRAW SET_ STOP/LIMIT/SL TLINEs - These lines needed for OPENING NEW ORDERS
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
} // void FUNCTION_DRAW_TLINES() {

// EO DRAW_TLINES
// +++ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
















// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
// CREATE LABEL IF IT DOES NOT EXIST
// This label is used each time during new Order opening (because of bug in MT4, when it opens fault orders)

//  ObjectSet("Label_Switch", OBJPROP_CORNER,2);
//  0 1
//  2 3

// ON---OFF
// |      |
// ON---OFF

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void FUNCTION_DRAW_CHANGE_LABEL() {
   if(ObjectFind("Label_Switch")==-1) {
      Mode_Order_Confirm        = "< OFF >"; // string        Mode_Indicator                = "";
      ObjectCreate( "Label_Switch", OBJ_LABEL,   0, 0, 0);
      ObjectSet(    "Label_Switch", OBJPROP_CORNER,    3);
      ObjectSet(    "Label_Switch", OBJPROP_XDISTANCE, 10);
      ObjectSet(    "Label_Switch", OBJPROP_YDISTANCE, 45);
//      ObjectSetText("Label_Switch", "ON  <=>  OFF", 10, "Arial", Red);
      ObjectSetText("Label_Switch", Mode_Order_Confirm, 10, "Arial", Red);
   }
// ON---OFF
// |      |
// ON---OFF
   if(ObjectFind("Label_Switch")!=-1) {
      if(ObjectGet("Label_Switch",OBJPROP_XDISTANCE)>=300 ) {
         Mode_Order_Confirm     = "< ON >";
         ObjectSetText("Label_Switch", Mode_Order_Confirm, 10, "Arial", Green);
      }
      if(ObjectGet("Label_Switch",OBJPROP_XDISTANCE)<300 ) {
         Mode_Order_Confirm     = "< OFF >";
         ObjectSetText("Label_Switch", Mode_Order_Confirm, 10, "Arial", Red);
      }
   }
//Print("OBJPROP_XDISTANCE  = ", ObjectGet("Label_Switch",OBJPROP_XDISTANCE) );
//Print("Mode_Order_Confirm = ", Mode_Order_Confirm );
} // void FUNCTION_DRAW_CHANGE_LABEL() {

// EO CREATE LABEL IF IT DOES NOT EXIST
// ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````




//+------------------------------------------------------------------+
