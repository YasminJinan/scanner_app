import 'package:flutter/material.dart';
import 'package:scanner_app/models/products.dart';
import 'package:scanner_app/utils/currency_format.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int qty;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const ProductCard({
    super.key,
    required this.product,
    required this.qty,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        color: Color(0xFFFFFBF4), // warm sand
        borderRadius: BorderRadius.circular(22),
        border: qty > 0
            ? Border.all(color: Color(0xFFF4A261), width: 2)
            : Border.all(color: Colors.transparent),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 14,
            offset: Offset(0, 6),
          ),
        ],
      ),
      
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ☕ ICON
            Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
  shape: BoxShape.circle,
  gradient: _getCategoryGradient(product.category),
),
              child: Icon(
                _getCategoryIcon(product.category),
                size: 32,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 12),

            // PRODUCT NAME
            Text(
              product.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2F2F2F),
                height: 1.2,
              ),
            ),

            SizedBox(height: 6),

            // PRICE
            Text(
              formatRupiah(product.price),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF7A6F5B),
              ),
            ),

            Spacer(),

            // ACTION
            qty == 0
                ? InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: onAdd,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 26, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border:
                            Border.all(color: Color(0xFFF4A261), width: 1.5),
                      ),
                      child: Text(
                        "Add",
                        style: TextStyle(
                          color: Color(0xFFF4A261),
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _counterBtn(Icons.remove, onRemove),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14),
                        child: Text(
                          "$qty",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2F2F2F),
                          ),
                        ),
                      ),
                      _counterBtn(Icons.add, onAdd),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  LinearGradient _getCategoryGradient(ProductCategory category) {
  switch (category) {
    case ProductCategory.coffee:
      return LinearGradient(
        colors: [Color(0xFFF4A261), Color(0xFFE6D3A3)],
      );
    case ProductCategory.iced:
      return LinearGradient(
        colors: [Color(0xFF4FACFE), Color(0xFF00F2FE)],
      );
    case ProductCategory.pastry:
      return LinearGradient(
        colors: [Color(0xFFFAD0C4), Color(0xFFFFE1A8)],
      );
  }
}

IconData _getCategoryIcon(ProductCategory category) {
  switch (category) {
    case ProductCategory.coffee:
      return Icons.local_cafe_rounded;
    case ProductCategory.iced:
      return Icons.ac_unit_rounded;
    case ProductCategory.pastry:
      return Icons.bakery_dining_rounded;
  }
}

  Widget _counterBtn(IconData icon, VoidCallback onTap) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Color(0xFFF4A261),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, size: 16, color: Colors.white),
      ),
    );
  }
}
