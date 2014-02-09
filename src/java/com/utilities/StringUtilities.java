package com.utilities;


import java.text.Normalizer;
import java.text.Normalizer.Form;

public class StringUtilities {
	public static String removeDiacriticalMarks(String string) {
		return Normalizer.normalize(string, Form.NFD).replaceAll(
				"\\p{InCombiningDiacriticalMarks}+", "");
	}
}
