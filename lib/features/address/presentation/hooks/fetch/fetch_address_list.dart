import 'package:fashionapp/features/address/domain/entities/address.dart';
import 'package:fashionapp/features/address/domain/repositories/address_repository.dart';
import 'package:fashionapp/features/address/domain/usecases/get_address_list.dart';
import 'package:fashionapp/features/address/presentation/hooks/results/ad_list_result.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

FetchAddressListResult fetchAddressList() {
  final context = useContext();
  final repository = context.read<AddressRepository>();
  final getAddressList = GetAddressList(repository);

  final address = useState<List<Address>>([]);
  final isLoading = useState(false);
  final error = useState<String?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      address.value = await getAddressList();
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

  return FetchAddressListResult(
    address: address.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
