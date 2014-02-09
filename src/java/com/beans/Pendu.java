package com.beans;

import com.utilities.StringUtilities;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.Serializable;
import java.util.Random;
import java.util.Vector;

@SuppressWarnings("serial")
public class Pendu implements Serializable {

    private Vector<String> dico = new Vector<String>();
    private Vector<Character> wordTested = new Vector<Character>();

    private String hiddenWord = new String();
    private StringBuffer discoverWord = new StringBuffer();
    private int nbTest = 0;

    public int getNbTest() {
        return nbTest;
    }

    public Pendu() {
        String sCurrentLine;

        try (BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream("c:\\Dictionnaire.txt"), "UTF-8"));) {

            while ((sCurrentLine = bufferedReader.readLine()) != null) {
                dico.add(sCurrentLine);
            }
            bufferedReader.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void getRandomWord() {

        Random rand = new Random();
        int randInt = rand.nextInt(dico.size());

        hiddenWord = dico.get(randInt);

        for (int i = 0; i < hiddenWord.length(); i++) {
            discoverWord = getDiscoverWord().append("_");
        }
    }

    public void refresh(char car) {
        for (int i = 0; i < hiddenWord.length(); i++) {
            if (Character.isLetter(car)
                    && (Character.toLowerCase(StringUtilities
                            .removeDiacriticalMarks(hiddenWord).charAt(i)) == Character
                    .toLowerCase(car))) {
                getDiscoverWord().setCharAt(i, hiddenWord.charAt(i));
            }
        }
        nbTest++;
        wordTested.add(Character.toUpperCase(car));
    }

    private boolean find() {
        return (!discoverWord.toString().contains("_"));
    }

    public boolean winner() {
        return find() && (nbTest < 10);
    }

    public boolean gameOver() {
        return (nbTest > 10);
    }

    /**
     * @return the hiddenWord
     */
    public String getHiddenWord() {
        return hiddenWord;
    }

    /**
     *
     * @return
     */
    public Vector<Character> getWordTested() {
        return wordTested;
    }

    /**
     * @return the discoverWord
     */
    public StringBuffer getDiscoverWord() {
        return discoverWord;
    }

}
