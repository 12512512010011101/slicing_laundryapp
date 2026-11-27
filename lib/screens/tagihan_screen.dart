import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../widgets/abs.dart';

class TagihanScreen extends StatelessWidget {
  const TagihanScreen({super.key});

  static const _grey = Color(0xFF5F6368);
  static const _soft = Color(0x73000000);

  Widget _saldoCard() {
    return Positioned(
      left: 22,
      top: 91,
      width: 316,
      height: 178,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(17),
        child: Container(
          color: AppColors.primary,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // lingkaran dekorasi kanan atas
              Positioned(
                left: 224,
                top: -105,
                width: 210,
                height: 210,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              at(33.7, 36.3, Text('Saldo LaundryPay', style: ts(14, FontWeight.w600, const Color(0x80FFFFFF), ls: 2))),
              at(32.8, 71.3, ico('wallet', 23, 25), h: 25),
              at(69.2, 71.3, Text('Rp 85.000', style: ts(24, FontWeight.w700, Colors.white, ls: 2.5)), h: 32),
              _pillButton(37.5, 107, 'plus_w', 16, 15, 'Top Up'),
              _pillButton(161.5, 115, 'transfer', 16, 15, 'Transfer'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pillButton(double left, double w, String icon, double iw, double ih, String label) {
    return Positioned(
      left: left,
      top: 114.5,
      width: w,
      height: 39,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFEAEDF5)),
        ),
        child: Stack(children: [
          at(15.5, 19.5, ico(icon, iw, ih), h: 16),
          at(36.9, 19.5, Text(label, style: ts(16, FontWeight.w600, Colors.white))),
        ]),
      ),
    );
  }

  Widget _unpaid() {
    return Positioned(
      left: 22,
      top: 313.5,
      width: 316,
      height: 181,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: DecoratedBox(
          decoration: cardBox(),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // header "Akan di antar hari ini"
              const Positioned(
                left: 0,
                right: 0,
                top: 0,
                height: 41,
                child: ColoredBox(color: Color(0xFFEEF1FD)),
              ),
              at(23.8, 22, ico('info', 13, 15), h: 16),
              at(46.8, 22, Text('Akan di antar hari ini', style: ts(12, FontWeight.w700, AppColors.primary, ls: 1.5))),
              at(18.2, 65.5, Text('#145', style: ts(12, FontWeight.w700, _soft, ls: 1))),
              at(18.3, 87.5, Text('Cuci & setrika', style: ts(12, FontWeight.w600, Colors.black))),
              Positioned(
                left: 233.2,
                top: 79.7,
                width: 62.4,
                height: 22.2,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(11),
                    border: Border.all(color: const Color(0xFFE7E1E1)),
                  ),
                  child: Center(child: Text('Diproses', style: ts(10, FontWeight.w700, AppColors.primary, ls: 1))),
                ),
              ),
              const Positioned(left: 0, right: 0, top: 109, child: Divider(height: 1, color: Color(0xFFEAEDF5))),
              at(19.9, 124, ico('bag', 17, 17), h: 18),
              at(39.4, 127.5, Text('4kg', style: ts(12, FontWeight.w600, _soft, ls: 1.2))),
              at(98, 124, ico('cal', 18, 21), h: 22),
              at(119.8, 127.5, Text('26 Agu 2026', style: ts(12, FontWeight.w600, _soft, ls: 1.2))),
              at(228.8, 124, ico('clock', 16, 16), h: 16),
              at(247.3, 127.5, Text('Reguler', style: ts(12, FontWeight.w600, _soft, ls: 1.2))),
              const Positioned(left: 0, right: 0, top: 139, child: Divider(height: 1, color: Color(0xFFEAEDF5))),
              at(20.7, 163.2, Text('Rp 24.000', style: ts(12, FontWeight.w600, Colors.black))),
            ],
          ),
        ),
      ),
    );
  }

  /// Satu baris transaksi.
  Widget _tx(double top, String tile, String icon, double iw, double ih, double il, double it,
      String title, String date,
      {String? id, double idLeft = 0, String? amount, Color? amountColor, double amountLeft = 0}) {
    return Positioned(
      left: 22,
      top: top,
      width: 316,
      height: 55,
      child: DecoratedBox(
        decoration: cardBox(),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 12.9,
              top: 10.5,
              width: 38.3,
              height: 35,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xFF000000 | int.parse(tile, radix: 16)),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [BoxShadow(color: Color(0x1F000000), blurRadius: 3, offset: Offset(0, 1))],
                ),
                child: Stack(clipBehavior: Clip.none, children: [Positioned(left: il, top: it, child: ico(icon, iw, ih))]),
              ),
            ),
            at(58.4, 19, Text(title, style: ts(12, FontWeight.w600, Colors.black))),
            if (id != null) at(idLeft, 19, Text(id, style: ts(12, FontWeight.w600, _soft))),
            at(58.4, 40.5, Text(date, style: ts(12, FontWeight.w400, _soft))),
            if (amount != null) at(amountLeft, 36.5, Text(amount, style: ts(12, FontWeight.w600, amountColor!))),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AbsPage(
      height: 770,
      children: [
        pageTitle('Tagihan'),
        _saldoCard(),
        at(23, 299.3, Text('Belum dibayar', style: ts(14, FontWeight.w600, _grey))),
        _unpaid(),
        at(22.4, 521, Text('Transaksi', style: ts(14, FontWeight.w600, _grey))),
        _tx(535.5, 'EEF1FD', 'tx_shirt', 28, 23, 4.6, 6, 'Cuci & Setrika', '27 Agustus 2026',
            id: '#145', idLeft: 169.2),
        _tx(597.5, 'D2FDE2', 'tx_plus', 16, 16, 12.4, 10, 'Top up saldo', '21 Agustus 2026',
            amount: '+ Rp 100.000', amountColor: const Color(0xFF45B18F), amountLeft: 210.5),
        _tx(659.5, 'EEF1FD', 'tx_iron', 20, 15, 9.6, 11, 'Setrika saja', '27 Agustus 2026',
            id: '#145', idLeft: 153.3, amount: '- Rp 8.000', amountColor: Colors.black, amountLeft: 225.4),
      ],
    );
  }
}
