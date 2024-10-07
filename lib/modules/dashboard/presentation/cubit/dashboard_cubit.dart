import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:market_news_app/core/use_cases/no_params.dart';
import 'package:market_news_app/modules/authentication/domain/entities/user_entity.dart';
import 'package:market_news_app/modules/dashboard/domain/entities/news_entity.dart';
import 'package:market_news_app/modules/dashboard/domain/use_cases/get_news_use_case.dart';
import 'package:market_news_app/modules/dashboard/domain/use_cases/get_user_use_case.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit(
    GetUserUseCase getUserUseCase,
    GetNewsUseCase getNewsUseCase,
  )   : _getUserUseCase = getUserUseCase,
        _getNewsUseCase = getNewsUseCase,
        super(DashboardInitial());

  final GetUserUseCase _getUserUseCase;
  final GetNewsUseCase _getNewsUseCase;

  Future<void> getUserInfo() async {
    emit(DashboardLoading());
    final result = await _getUserUseCase(NoParams());
    result.fold(
      (error) => emit(GetUserInfoError(message: error.message)),
      (user) => emit(GetUserInfoSuccessful(user: user)),
    );
  }

  Future<void> getNews() async {
    emit(DashboardLoading());
    final result = await _getNewsUseCase(NoParams());
    result.fold(
      (error) => emit(GetNewsError(message: error.message)),
      (news) => emit(GetNewsSuccessful(news: news)),
    );
  }
}
