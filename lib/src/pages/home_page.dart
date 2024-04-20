// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:store_app/src/design/colors.dart';
import 'package:store_app/src/design/radius.dart';
import 'package:store_app/src/widgets/custom_money_display.dart';
import 'package:store_app/src/widgets/home_app_bar_title.dart';
import 'package:store_app/src/widgets/product_detail_card.dart';
import 'package:store_app/src/widgets/summary_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  var buttonStyleInactive = ElevatedButton.styleFrom(
    elevation: 0,
    backgroundColor: StoreAppColors.brandLightColor,
    shadowColor: StoreAppColors.brandLightColor
  );

  var buttonStyleActive = ElevatedButton.styleFrom(
    backgroundColor: StoreAppColors.brandSecondaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    )
  );

  Widget currentDetailWidget = const BottomHomePageBody();
  late ButtonStyle categorieBtnStyle;
  late ButtonStyle recentTransactionBtnStyle;

  @override
  void initState() {
    super.initState();
    categorieBtnStyle = buttonStyleActive;
    recentTransactionBtnStyle = buttonStyleInactive;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      toolbarHeight: 70.0,
      elevation: 50,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: StoreAppRadius.small, 
          bottomRight: StoreAppRadius.small
        )
      ),
      backgroundColor: StoreAppColors.brandLightColor,
        title: const Padding(
          padding: EdgeInsets.fromLTRB(16.0, 45.0, 16.0, 40.0),
          child: HomeAppBarTitle()
        ),
      ),
      body: Column(
        children: [
          const TopHomePageBody(),
          MidHomePageBody(
            categorieBtnStyle: categorieBtnStyle,
            recentTransactionBtnStyle: recentTransactionBtnStyle,
            categoriesBtnAction: () => {
              setState(() {
                currentDetailWidget = const BottomHomePageBody();
                categorieBtnStyle = buttonStyleActive; 
                recentTransactionBtnStyle = buttonStyleInactive;
              })
            },
            recentBtnAction: (){
              setState(() {
                currentDetailWidget = const RecentTransactions();
                recentTransactionBtnStyle = buttonStyleActive; 
                categorieBtnStyle = buttonStyleInactive;
              });
            },          
          ),
          Expanded(child: currentDetailWidget)
      ],)
    );
  }
}


class TopHomePageBody extends StatelessWidget {
  const TopHomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      transform: Matrix4.translationValues(0, -12, 0),
      decoration: const BoxDecoration(
        color: StoreAppColors.brandPrimaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: StoreAppRadius.small, 
          bottomRight: StoreAppRadius.small),
      ),
      height: 340,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Text(
              'Saldo Disponible',
              style: Theme.of(context).textTheme.displaySmall!, 
          ),),
          CustomMoneyDisplay(
            amount: 1750050.53,
            padding: const EdgeInsets.only(top: 16, right: 4),
            amountStyle: Theme.of(context).textTheme.displayLarge!, 
            amountStyleSmall: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: StoreAppColors.brandLightColor,
            )
          ),
          SummaryCard(
            typeSummaryCard: TypeSummaryCard.incomes,
            amount: 585000,
            period: 'Desde 1 a 31 Enero',
            action: () => print('Ingresos'), 
          ),
          SummaryCard(
            typeSummaryCard: TypeSummaryCard.spending,
            amount: 85000,
            period: 'Desde 1 a 31 Enero',
            action: () => print('Egresos'), 
          ),
        ],
      ),
    );
  }
}



class MidHomePageBody extends StatelessWidget {
  final ButtonStyle? categorieBtnStyle;
  final ButtonStyle? recentTransactionBtnStyle;
  final void Function()? categoriesBtnAction;
  final void Function()? recentBtnAction;

  const MidHomePageBody({
    super.key, 
    this.categorieBtnStyle, 
    this.recentTransactionBtnStyle, 
    this.categoriesBtnAction, 
    this.recentBtnAction
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      height: 74,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: StoreAppColors.brandLightColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        ElevatedButton(
          style: categorieBtnStyle,
          onPressed: categoriesBtnAction, 
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 22),
            child: Text('Categorias',
            style: TextStyle(color: StoreAppColors.brandDarkColor, fontSize: 14),
            ),
          )
        ),
        ElevatedButton(
          style: recentTransactionBtnStyle,
          onPressed: recentBtnAction, 
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 22),
            child: Text('Transacciones',
            style: TextStyle(color: StoreAppColors.brandDarkColor, fontSize: 14),
            ),
          )
        ),
      ],),
    );
  }
}


class BottomHomePageBody extends StatelessWidget {
  const BottomHomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextButton(
          style: const ButtonStyle(alignment: Alignment.centerRight),
          onPressed: (){
            print('le diste clic a view all');
          }, 
          child: const Text(
            'View All',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: StoreAppColors.brandPrimaryColor,
            ),)
        ),
        const ProductDetailCard(
          pathToProductImage: 'assets/images/pizza.png',
          amount: 150254.05,
          productName: 'Comida & Bebida',
          currentSells: '2250',
          percentage: '1.8',
          typeProductDetailCard: TypeProductDetailCard.incomes,
        ),
        const ProductDetailCard(
          pathToProductImage: 'assets/images/health.png',
          amount: 590254.05,
          productName: 'Salud',
          currentSells: '6700',
          percentage: '79.8',
          typeProductDetailCard: TypeProductDetailCard.outcomes,
        ),
        const ProductDetailCard(
          pathToProductImage: 'assets/images/pizza.png',
          amount: 380254.05,
          productName: 'Productos',
          currentSells: '3100',
          percentage: '15.5',
          typeProductDetailCard: TypeProductDetailCard.incomes,
        ),
        const ProductDetailCard(
          pathToProductImage: 'assets/images/tv.png',
          amount: 122000.05,
          productName: 'Electronicos',
          currentSells: '6250',
          percentage: '43.6',
          typeProductDetailCard: TypeProductDetailCard.incomes,
        ),
        const ProductDetailCard(
          pathToProductImage: 'assets/images/health.png',
          amount: 340254.05,
          productName: 'Salud',
          currentSells: '8700',
          percentage: '25.8',
          typeProductDetailCard: TypeProductDetailCard.outcomes,
        ),
      ],
    );
  }
}

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Este es el reto',
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}