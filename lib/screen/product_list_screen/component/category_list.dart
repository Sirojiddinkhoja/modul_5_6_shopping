import 'package:flutter/material.dart';
import 'package:modul_5_6_shopping/config/app_colors.dart';

class CategoryList extends StatelessWidget {
  final List<String> categories;
  final String selected;
  final ValueChanged<String> onSelected;

  const CategoryList({
    super.key,
    required this.categories,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        separatorBuilder: (_,_)=>SizedBox(width: 30,),
        scrollDirection: .horizontal,
        itemBuilder: (context,i){
          final category=categories[i];
          final isSelected=category==selected;
          return InkWell(
            onTap: ()=>onSelected(category),
            child: Column(
              children: [
                Text(
                  category,style: TextStyle(
                  fontSize: 18,
                  color: isSelected?AppColors.textDark:AppColors.greyTitle
                ),
                ),
                SizedBox(height: 4,),
                AnimatedContainer(duration: Duration(milliseconds: 200),
                  height: 2,
                  width: isSelected?28:0,
                  color: AppColors.accentOrange,
                )
              ],
            ),
          );
        },
        itemCount: categories.length,
      ),
    );
  }
}
