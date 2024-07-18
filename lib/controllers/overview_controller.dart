import 'package:get/get.dart';
import 'package:myapp/services/budgetMovement.dart';

class OverviewController extends GetxController {
  var data = <List<Map<String, dynamic>>>[[], [], []].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMovimientosYPresupuestos(DateTime.now().year, DateTime.now().month);
  }

  Future<void> fetchMovimientosYPresupuestos(int year, int month) async {
    try {
      isLoading(true);
      List<List<Map<String, dynamic>>> datos = await BudgetService().getMovimientosYPresupuestosPorCategoria( year, month);
      data.value = datos;
    } catch (error) {
      print('Error fetching data: $error');
    } finally {
      isLoading(false);
    }
  }
}
