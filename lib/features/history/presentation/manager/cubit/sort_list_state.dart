part of 'sort_list_cubit.dart';

sealed class SortListState {
  const SortListState();
}

final class SortListInitial extends SortListState {}

final class ListSorted extends SortListState {}

final class ListNotSorted extends SortListState {}
