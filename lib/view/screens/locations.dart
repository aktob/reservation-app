import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SavedAddressesWithDataPage extends StatefulWidget {
  const SavedAddressesWithDataPage({super.key});

  @override
  State<SavedAddressesWithDataPage> createState() =>
      _SavedAddressesWithDataPageState();
}

class _SavedAddressesWithDataPageState
    extends State<SavedAddressesWithDataPage> {
  // Mock data for saved addresses
  List<SavedAddress> savedAddresses = [
    SavedAddress(
      id: '1',
      label: 'المنزل',
      address: 'الرياض, محمد بن سليمان الحمدان, 7106',
      isSelected: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // عشان ما يضيفش سهم تلقائي
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end, // يخليهم في اليمين
          children: [
            const Text(
              "العناوين المحفوظة",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(width: 8),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(242, 242, 242, 1),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_forward_ios_rounded),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(children: [_buildMainContent(context)]),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    // Check if list is empty
    if (savedAddresses.isEmpty) {
      // Show empty screen
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: _getResponsivePadding(context, 16),
          vertical: 32,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLocationIcon(),
            SizedBox(height: _getResponsiveSpacing(context, 32)),
            Text(
              'لا توجد عناوين محفوظة حالياً',
              style: TextStyle(
                fontFamily: 'NotoKufiArabic',
                fontSize: _getResponsiveFontSize(context, 18),
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: _getResponsiveSpacing(context, 16)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: _getResponsivePadding(context, 16),
              ),
              child: Text(
                'أضف موقعك حتى نتمكن من مساعدتك على اختيار مواعيد خدمتك المفضلة',
                style: TextStyle(
                  fontFamily: 'NotoKufiArabic',
                  fontSize: _getResponsiveFontSize(context, 15),
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  height: 1.87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: _getResponsiveSpacing(context, 40)),
            _buildAddAddressButton(context),
          ],
        ),
      );
    } else {
      // Show saved addresses list
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: _getResponsivePadding(context, 16),
          vertical: 16,
        ),
        child: Column(
          children: [
            _buildAddNewAddressButton(context),
            SizedBox(height: _getResponsiveSpacing(context, 16)),
            ...savedAddresses.map(
              (address) => _buildAddressCard(context, address),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildAddAddressButton(BuildContext context) {
    return SizedBox(
      width: _getResponsiveWidth(context, 239),
      height: 48,
      child: ElevatedButton(
        onPressed: () {
          _showAddAddressDialog(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
        ),
        child: Text(
          'إضافة عنوان جديد',
          style: TextStyle(
            fontFamily: 'NotoKufiArabic',
            fontSize: _getResponsiveFontSize(context, 14),
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildLocationIcon() {
    return Container(
      width: 200,
      height: 200,
      decoration: const BoxDecoration(shape: BoxShape.circle),

      //  no location icon
      child: Icon(CupertinoIcons.map_pin_slash, size: 200),
    );
  }

  Widget _buildAddNewAddressButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      margin: const EdgeInsets.only(bottom: 8),
      child: ElevatedButton(
        onPressed: () {
          _showAddAddressDialog(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          side: const BorderSide(color: Colors.black, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add, color: Colors.black, size: 20),
            const SizedBox(width: 8),
            Text(
              'اضافة عنوان جديد',
              style: TextStyle(
                fontFamily: 'NotoKufiArabic',
                fontSize: _getResponsiveFontSize(context, 16),
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressCard(BuildContext context, SavedAddress address) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(233, 233, 233, 0.5),
        border: Border.all(color: const Color.fromRGBO(233, 233, 233, 0.5)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Top Row with Edit Button and Selection Circle
          Row(
            children: [
              // Edit Button
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'تعديل',
                  style: TextStyle(
                    fontFamily: 'NotoKufiArabic',
                    fontSize: _getResponsiveFontSize(context, 16),
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
              const Spacer(),
              // Address Label
              Text(
                address.label,
                style: TextStyle(
                  fontFamily: 'NotoKufiArabic',
                  fontSize: _getResponsiveFontSize(context, 16),
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(0, 0, 0, 0.7),
                ),
                textAlign: TextAlign.right,
              ),
              const SizedBox(width: 16),
              // Selection Circle
              GestureDetector(
                onTap: () {
                  setState(() {
                    // Update selection state
                    for (var addr in savedAddresses) {
                      addr.isSelected = addr.id == address.id;
                    }
                  });
                },
                child: Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 2),
                    shape: BoxShape.circle,
                  ),
                  child: address.isSelected
                      ? Container(
                          margin: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        )
                      : null,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Address Details
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              address.address,
              style: TextStyle(
                fontFamily: 'NotoKufiArabic',
                fontSize: _getResponsiveFontSize(context, 16),
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(0, 0, 0, 0.5),
                height: 1.5,
              ),
              textAlign: TextAlign.right,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  void _showAddAddressDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text(
            'إضافة عنوان جديد',
            style: TextStyle(fontFamily: 'NotoKufiArabic'),
            textAlign: TextAlign.right,
          ),
          content: const Text(
            'هل تريد إضافة عنوان جديد؟',
            style: TextStyle(fontFamily: 'NotoKufiArabic'),
            textAlign: TextAlign.right,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'إلغاء',
                style: TextStyle(
                  fontFamily: 'NotoKufiArabic',
                  color: Colors.grey,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _addNewAddress();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'إضافة',
                style: TextStyle(
                  fontFamily: 'NotoKufiArabic',
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _addNewAddress() {
    setState(() {
      // Set all existing addresses as unselected
      for (var addr in savedAddresses) {
        addr.isSelected = false;
      }

      // Add new address
      savedAddresses.add(
        SavedAddress(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          label: 'العمل',
          address: 'الرياض, شارع الملك فهد, مجمع الأعمال',
          isSelected: true,
        ),
      );
    });
  }

  // Responsive helper methods (same as original)
  static double _getResponsiveFontSize(
    BuildContext context,
    double baseFontSize,
  ) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 360) {
      return baseFontSize * 0.9;
    } else if (screenWidth > 420) {
      return baseFontSize * 1.1;
    }
    return baseFontSize;
  }

  static double _getResponsivePadding(
    BuildContext context,
    double basePadding,
  ) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 360) {
      return basePadding * 0.8;
    } else if (screenWidth > 420) {
      return basePadding * 1.2;
    }
    return basePadding;
  }

  static double _getResponsiveSpacing(
    BuildContext context,
    double baseSpacing,
  ) {
    double screenHeight = MediaQuery.of(context).size.height;
    if (screenHeight < 600) {
      return baseSpacing * 0.7;
    } else if (screenHeight > 800) {
      return baseSpacing * 1.2;
    }
    return baseSpacing;
  }

  static double _getResponsiveWidth(BuildContext context, double baseWidth) {
    double screenWidth = MediaQuery.of(context).size.width;
    double maxWidth = screenWidth * 0.8;
    return baseWidth > maxWidth ? maxWidth : baseWidth;
  }
}

// Data model for saved addresses
class SavedAddress {
  final String id;
  final String label;
  final String address;
  bool isSelected;

  SavedAddress({
    required this.id,
    required this.label,
    required this.address,
    this.isSelected = false,
  });
}
