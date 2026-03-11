import 'package:fashionapp/features/address/domain/entities/address.dart';
import 'package:fashionapp/features/address/domain/repositories/address_repository.dart';
import 'package:fashionapp/features/address/domain/usecases/get_default_address.dart';
import 'package:fashionapp/features/address/presentation/hooks/results/default_result.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

FetchDefaultAddressResult fetchDefaultAddress() {
  final context = useContext();
  final repository = context.read<AddressRepository>();
  final getDefaultAddress = GetDefaultAddress(repository);

  final address = useState<Address?>(null);
  final isLoading = useState(false);
  final error = useState<String?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      address.value = await getDefaultAddress();
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, const []);

  void refetch() {
    isLoading.value = false;
    fetchData();
  }

  return FetchDefaultAddressResult(
    address: address.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
