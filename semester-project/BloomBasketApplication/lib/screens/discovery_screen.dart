import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../app_theme.dart';
import '../providers/app_state.dart';
import '../widgets/product_card.dart';
import '../widgets/bottom_nav_bar.dart';

class DiscoveryScreen extends StatefulWidget {
  const DiscoveryScreen({super.key});

  @override
  State<DiscoveryScreen> createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<DiscoveryScreen> {
  String _selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final filteredProducts = _selectedCategory == 'All'
        ? appState.products
        : appState.products
              .where((p) => p.category == _selectedCategory)
              .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DISCOVER',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            letterSpacing: 4,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      bottomNavigationBar: const BotanicalBottomNavBar(currentIndex: 1),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'SEARCH ARRANGEMENTS...',
                hintStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppTheme.outline.withValues(alpha: 0.5),
                ),
                prefixIcon: const Icon(Icons.search, size: 20),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: AppTheme.outline.withValues(alpha: 0.2),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: AppTheme.primaryGreen),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),

          // Categories Horizontal Scroll
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _DiscoveryCategoryChip(
                  label: 'All',
                  isActive: _selectedCategory == 'All',
                  onTap: () => setState(() => _selectedCategory = 'All'),
                ),
                _DiscoveryCategoryChip(
                  label: 'Seasonal',
                  isActive: _selectedCategory == 'Seasonal',
                  onTap: () => setState(() => _selectedCategory = 'Seasonal'),
                ),
                _DiscoveryCategoryChip(
                  label: 'Boutique',
                  isActive: _selectedCategory == 'Boutique',
                  onTap: () => setState(() => _selectedCategory = 'Boutique'),
                ),
                _DiscoveryCategoryChip(
                  label: 'Artisanal',
                  isActive: _selectedCategory == 'Artisanal',
                  onTap: () => setState(() => _selectedCategory = 'Artisanal'),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Results Grid
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = 2;
                if (constraints.maxWidth > 1200) {
                  crossAxisCount = 5;
                } else if (constraints.maxWidth > 900) {
                  crossAxisCount = 4;
                } else if (constraints.maxWidth > 600) {
                  crossAxisCount = 3;
                }
                return GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: 0.65,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 24,
                  ),
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = filteredProducts[index];
                    return ProductCard(
                      product: product,
                      onTap: () => context.go('/product/${product.id}'),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _DiscoveryCategoryChip extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _DiscoveryCategoryChip({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? AppTheme.primaryGreen : Colors.transparent,
          border: Border.all(
            color: isActive
                ? AppTheme.primaryGreen
                : AppTheme.outline.withValues(alpha: 0.3),
          ),
          borderRadius: BorderRadius.circular(9999),
        ),
        child: Center(
          child: Text(
            label.toUpperCase(),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: isActive ? Colors.white : AppTheme.primaryGreen,
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }
}
