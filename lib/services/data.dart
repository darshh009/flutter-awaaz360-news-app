import 'package:news_app/models/category_model.dart';



/// this is the function to get category anme and image from the category model
List<CategoryModel> getCategories(){
  List<CategoryModel> category=[];

  /// object of class catgeorymodel
  CategoryModel categoryModel =new CategoryModel();


  /// business part
  categoryModel.categoryName="Business";
  categoryModel.image="assets/images/business.jpg";
  category.add(categoryModel);
  categoryModel=new CategoryModel();


  /// entertainment part
  categoryModel.categoryName="Entertainment";
  categoryModel.image="assets/images/entertainment.jpg";
  category.add(categoryModel);
  categoryModel=new CategoryModel();

  /// general part
  categoryModel.categoryName="General";
  categoryModel.image="assets/images/general.jpg";
  category.add(categoryModel);
  categoryModel=new CategoryModel();

  /// health part
  categoryModel.categoryName="Health";
  categoryModel.image="assets/images/health.jpg";
  category.add(categoryModel);
  categoryModel=new CategoryModel();

  /// sports part
  categoryModel.categoryName="Sports";
  categoryModel.image="assets/images/sport.jpg";
  category.add(categoryModel);
  categoryModel=new CategoryModel();

  ///science part
  categoryModel.categoryName="Science";
  categoryModel.image="assets/images/science.jpg";
  category.add(categoryModel);
  categoryModel=new CategoryModel();


  return category;
}