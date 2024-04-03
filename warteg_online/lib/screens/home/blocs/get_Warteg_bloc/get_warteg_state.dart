part of 'get_warteg_bloc.dart';

sealed class GetWartegState extends Equatable {
  const GetWartegState();
  
  @override
  List<Object> get props => [];
}

final class GetWartegInitial extends GetWartegState {}

final class GetWartegFailure extends GetWartegState {}
final class GetWartegLoading extends GetWartegState {}
final class GetWartegSuccess extends GetWartegState {
  final List<Warteg> wartegs;

  const GetWartegSuccess(this.wartegs);

  @override
  List<Object> get props => [wartegs];
}