import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:warteg_repository/warteg_repository.dart';

part 'get_warteg_event.dart';
part 'get_warteg_state.dart';

class GetWartegBloc extends Bloc<GetWartegEvent, GetWartegState> {
  final Warteg_Repo _wartegRepo;

  GetWartegBloc(this._wartegRepo) : super(GetWartegInitial()) {
    on<GetWarteg>((event, emit) async {
      emit(GetWartegLoading());
      try {
        List<Warteg> wartegs = await _wartegRepo.getWarteg();
        emit(GetWartegSuccess(wartegs));
      } catch (e) {
        emit(GetWartegFailure());
      }
    });
  }
}