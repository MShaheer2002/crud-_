import 'package:bloc/bloc.dart';
import '../common/services/api.dart';
import './crud_state.dart';
import './crud_event.dart';

class CrudBloc extends Bloc<CrudEvent, CrudState> {
  CrudBloc() : super(CrudState()) {
    on<CreateProduct>(_create);
    on<UpdateProduct>(_update);
    on<DeleteProduct>(_delete);
  }

  void _create(CreateProduct event, Emitter<CrudState> emit) {
    emit(state.copyWith(state.name, state.price, state.desc));
    var data = {
      "pname": event.name,
      "pprice": event.price,
      "pdesc": event.desc,
    };
    Api.Addproduct(data);
  }

  void _update(UpdateProduct event, Emitter<CrudState> emit) {
    emit(state.copyWith(state.name, state.price, state.desc));
    Api.UpdatedProduct(event.id, event.data);
    // print(event.data);
  }

  void _delete(DeleteProduct event,Emitter<CrudState> emit ){
    Api.deleteProduct(event.id);
  }
}
