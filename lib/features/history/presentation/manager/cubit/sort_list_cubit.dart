import 'package:bloc/bloc.dart';

part 'sort_list_state.dart';

class SortListCubit extends Cubit<SortListState> {
  SortListCubit() : super(SortListInitial());

  isListSorted(bool isFiltered) {
    switch (isFiltered) {
      case false:
        emit(ListNotSorted());
      case true:
        emit(ListSorted());
    }
  }
}
