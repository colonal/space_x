import 'package:flutter/material.dart';

class CapsuleItem extends StatelessWidget {
  final String? nameOfCapsule;
  final Color? backgroundColor;
  final String? lastUpdate;
  final int? reuseCount;
  final String? status;
  final String? typeofCapsule;

  const CapsuleItem({
    super.key,
    this.nameOfCapsule,
    this.status,
    this.lastUpdate,
    this.reuseCount,
    this.typeofCapsule,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.blue, // Default color is blue if not provided
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nameOfCapsule ?? 'Capsule Name',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
           const SizedBox(height: 8.0),
            Text(
              'Status: ${status ?? "Unknown"}',
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Last Update: ${lastUpdate ?? "N/A"}',
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
         const    SizedBox(height: 8.0),
            Text(
              'Reuse Count: ${reuseCount ?? 0}',
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
           const  SizedBox(height: 8.0),
            Text(
              'Type: ${typeofCapsule ?? "Unknown"}',
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}