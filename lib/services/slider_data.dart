import 'package:news_app/models/slider_model.dart';

List<SliderModel> getSliders(){

  List<SliderModel> slider=[];

  SliderModel categoryModel=new SliderModel();

  /// first slider
  categoryModel.image="assets/images/business.jpg";
  categoryModel.sliderName="Narender Modi launches Swaach Bharat 2025 Plan";
  slider.add(categoryModel);
  categoryModel=new SliderModel();

  /// second slider
  categoryModel.image="assets/images/health.jpg";
  categoryModel.sliderName="Narender Modi launches Swaach Bharat 2025 Plan";
  slider.add(categoryModel);
  categoryModel=new SliderModel();

  /// third slider
  categoryModel.image="assets/images/general.jpg";
  categoryModel.sliderName="Narender Modi launches Swaach Bharat 2025 Plan";
  slider.add(categoryModel);
  categoryModel=new SliderModel();

  return slider;






}