import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/category_controller.dart';
import 'create_category_page.dart';
import 'edit_category_page.dart';

class ViewCategoriesPage extends StatefulWidget {
  @override
  _ViewCategoriesPageState createState() => _ViewCategoriesPageState();
}

class _ViewCategoriesPageState extends State<ViewCategoriesPage> {
  final CategoryController categoryController = Get.put(CategoryController());

  @override
  void initState() {
    super.initState();
    categoryController.fetchTiposCategorias();
  }

  Future<void> _navigateToCreateCategoryPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateCategoryPage()),
    );
    if (result == true) {
      categoryController.fetchTiposCategorias();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ver Categorías',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _navigateToCreateCategoryPage,
              child: Text(
                'Crear Nueva Categoría',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 0, 20, 60),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Obx(() {
                if (categoryController.groupedCategory.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView(
                    children:
                        categoryController.groupedCategory.entries.map((entry) {
                      var tipoName = entry.key;
                      var categorias = entry.value;

                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tipoName,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ...categorias.map((categoria) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(categoria['category_name']),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.edit),
                                          onPressed: () async {
                                            int categoryId = categoria['id'];
                                            await categoryController
                                                .fetchCategoriaById(categoryId);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    EditCategoryPage(
                                                        categoria:
                                                            categoryController
                                                                .selectedCategoryData
                                                                .value),
                                              ),
                                            );
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.delete),
                                          onPressed: () {
                                            int categoryId = categoria['id'];
                                            categoryController
                                                .deleteCategory(categoryId);
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
