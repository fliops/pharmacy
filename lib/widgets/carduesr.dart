import 'package:flutter/material.dart';

class CardUser extends StatelessWidget {
  final VoidCallback? ontap;
  final String email;
  final String username;

  const CardUser({
    Key? key,
    required this.ontap,
    required this.email,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: ontap,
        child: Card(
          color: const Color(0xffe3f1fc),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: ListTile(
                  isThreeLine: true,
                  title: Text(
                    ' $email  ',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "  $username ",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
