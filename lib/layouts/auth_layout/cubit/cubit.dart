import 'package:factum_mart/layouts/auth_layout/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FactumMartAuthLayoutCubit extends Cubit<FactumMartAuthLayoutStates> {
  FactumMartAuthLayoutCubit() : super(FactumMartAuthLayoutInitialState());

  static FactumMartAuthLayoutCubit get(context) => BlocProvider.of(context);
}
