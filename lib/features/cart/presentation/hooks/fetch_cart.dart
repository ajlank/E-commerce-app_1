import 'package:fashionapp/features/cart/domain/entities/cart.dart';
import 'package:fashionapp/features/cart/domain/repositories/cart_repository.dart';
import 'package:fashionapp/features/cart/domain/usecases/fetch_cart.dart';
import 'package:fashionapp/features/cart/presentation/hooks/results/fetch_cart_result.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

FetchCartResult fetchCart(){
  final context = useContext();
  final repository = context.read<CartRepository>();
  final fetchCartUsecase = FetchCart(repository);

  final cart=useState<List<Cart>>([]);
  final isLoading=useState(false);
  final error=useState<String?>(null);

  String? accessToken= GetStorage().read('accessToken');
  Future<void>fetchData()async{
    isLoading.value=true;
    try{
      cart.value=await fetchCartUsecase();
    }catch(e){
      error.value = e.toString();
    }finally{
      isLoading.value=false;
    }
  }

  useEffect((){
    if(accessToken!=null){
      fetchData();
    }
    return null;
  },const []);

  void refetch(){
    isLoading.value=false;
    fetchData();
  }
  return FetchCartResult(
    cart: cart.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch);
}
