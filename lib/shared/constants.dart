import 'package:flutter/material.dart';

// Primary Color
const int primR = 52;
const int primG = 152;
const int primB = 219;

// Accent Color
const int accR = 46;
const int accG = 204;
const int accB = 113;

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
    borderRadius: const BorderRadius.all(
      const Radius.circular(15.0),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromRGBO(primR, primG, primB, 1), width: 2.0),
    borderRadius: const BorderRadius.all(
      const Radius.circular(15.0),
    ),
  ),
);
