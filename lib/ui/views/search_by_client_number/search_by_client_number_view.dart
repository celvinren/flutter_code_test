import 'package:dev_coding_test_calvin/app/models/transaction.dart';
import 'package:dev_coding_test_calvin/ui/widgets/horizontal_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import './search_by_client_number_view_model.dart';

class SearchByClientNumberView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchByClientNumberViewModel>.reactive(
      viewModelBuilder: () => SearchByClientNumberViewModel(),
      onModelReady: (SearchByClientNumberViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        SearchByClientNumberViewModel model,
        Widget? child,
      ) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text("Search Client Number"),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
              child: Column(
                children: [
                  Form(
                    key: model.clientNumberFormKey,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: TextFormField(
                            controller: model.textFieldController,
                            validator: model.validatorClientNumber,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Enter a client number',
                              suffixIcon: IconButton(
                                onPressed: () => model.cleanAction(context),
                                icon: Icon(Icons.clear),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: ElevatedButton(onPressed: () => model.searchClientNumber(context), child: Text('Search')),
                        ),
                      ],
                    ),
                  ),
                  Expanded(flex: 8, child: BuildTransactionList()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class BuildTransactionList extends HookViewModelWidget<SearchByClientNumberViewModel> {
  @override
  Widget buildViewModelWidget(BuildContext context, SearchByClientNumberViewModel viewModel) {
    List<Transaction> searchResultList = useValueListenable(viewModel.getSearchResultList);

    List<CellInfo> titleList = [
      CellInfo("Client Number", 150, filterName: Transaction.clientNumberStr),
      CellInfo("Product Group", 150, filterName: Transaction.productGroupCodeStr),
      CellInfo("Transaction Date", 150, filterName: Transaction.transactionDateStr),
      CellInfo("Transaction Price", 140, filterName: Transaction.transactionPriceStr),
    ];

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h),
          child: Text("Total Result: ${searchResultList.length}"),
        ),
        Expanded(
          flex: 8,
          child: HorizontalTable(searchResultList: searchResultList, titleList: titleList),
        ),
      ],
    );
  }
}
