<%-- 
    Document   : pendu
    Created on : 8 févr. 2014, 09:42:24
    Author     : Spleen
--%>

<%@page import="java.util.Vector"%>
<%@page import="com.beans.Pendu"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%@page import="com.beans.Pendu"%>
        <script src="http://french.jotform.com/js/vendor/jquery-1.8.0.min.js?v=3.2.514" type="text/javascript"></script>
        <script src="http://french.jotform.com/js/vendor/maskedinput.min.js?v=3.2.514" type="text/javascript"></script>
        <script src="http://french.jotform.com/static/jotform.js?3.2.514" type="text/javascript"></script>
        <script type="text/javascript">
            JotForm.init(function() {
                JotForm.setInputTextMasking('input_1', '@');
                JotForm.description('input_1', 'Attention vous devez indiquer une lettre');
                JotForm.alterTexts({"alphabetic": "Ce champ ne peut contenir que des lettres.", "alphanumeric": "Ce champ ne peut contenir que des lettres et des chiffres.", "confirmClearForm": "Êtes-vous certain d'effacer le formulaire?", "confirmEmail": "Email ne correspond pas", "email": "Saisir une adresse courriel valide", "generalError": "Il y a des erreurs dans le formulaire. Merci de les corriger avant de continuer.", "generalPageError": "Il ya des erreurs sur cette page. S'il vous plaît corriger avant de continuer.", "gradingScoreError": "Le score total devrais être moins ou égal à", "incompleteFields": "Des champs obligatoires ne sont pas complétés. Veuillez les compléter.", "inputCarretErrorA": "L'entrée ne doit pas être inférieure à la valeur minimale:", "inputCarretErrorB": "L'entré de devrais pas être plus grande que la valeur maximum:", "lessThan": "Votre score devrait être inférieur ou égal à ", "maxDigitsError": "Les chiffres maximum autorisé sont ", "maxSelectionsError": "Vous avez sélectionné le maximum autorisé.", "minSelectionsError": "Le nombre minimum requis de sélections est", "multipleFileUploads_emptyError": "{file} est vide, veuillez sélectionner à nouveau les fichiers sans elle.", "multipleFileUploads_minSizeError": "{file} est trop petite, la taille de fichier minimale est {minSizeLimit}.", "multipleFileUploads_onLeave": "Les fichiers ont été envoyé, si vous quittez maintenant l'envoi sera annulé.", "multipleFileUploads_sizeError": "{file} est trop grand, la taille maximale d'un fichier est {sizeLimit}.", "multipleFileUploads_typeError": "{file} a invalide extension. Seulement {extensions} sont autorisées.", "numeric": "Ce champ ne peut contenir que des valeurs numériques", "pastDatesDisallowed": "La date doit pas être dans le passé", "pleaseWait": "S'il vous plaît patienter...", "required": "Ce champs est requis.", "requireEveryRow": "Chaque ligne est nécessaire.", "requireOne": "Au moins un champ est requis", "submissionLimit": "Désolé ! Une seule inscription est permise. Les propositions multiples sont désactivés pour ce formulaire.", "uploadExtensions": "Vous ne pouvez uploader que les fichiers suivants :", "uploadFilesize": "La taille du fichier ne peut pas dépasser :"});
            });
        </script>

        <link href="http://french.jotform.com/static/formCss.css?3.2.514" rel="stylesheet" type="text/css" />
        <link type="text/css" media="print" rel="stylesheet" href="http://french.jotform.com/css/printForm.css?3.2.514" />
        <style>
            *{
                
            }
            html, body{
                margin:0;
                padding:0;
                background-image: url("image.jpeg");
                
            }
            .form-header-group{
                text-align:center;
                font-size:22px;
                background-color: #fff;
            }
             #pendu{
                 width:500px;
                 margin: 50px auto;
                 text-align:center;
                 border:none;
             }
            #pendu td{
                
                background-color:#ffffff;
            }
            
            
        </style>

        <link type="text/css" rel="stylesheet" href="http://french.jotform.com/css/styles/buttons/form-submit-button-simple_orange.css?3.2.514"/>
        <form class="jotform-form" action="./pendu" method="post" name="form_40364041732344" id="40364041732344" accept-charset="utf-8">
            <input type="hidden" name="formID" value="40364041732344" />
            <div class="form-all">
                <ul class="form-section">
                    <li id="cid_3" class="form-input-wide">
                        <div class="form-header-group">
                            <h1 id="header_3" class="form-header">
                                Le Jeu du Pendu
                            </h1>
                        </div>
                    </li>
                    <table id="pendu" cellpadding="0" cellmargin="0" border="0">
                    <tr>
                        <td>
                            <li class="form-line" id="id_1">
                                <label class="form-label-top" id="label_1" for="input_1">
                                    Taper une lettre<span class="form-required">*</span>
                                </label>
                                <div id="cid_1" class="form-input-wide">
                                    <input type="text" class=" form-textbox validate[required, Alphabetic]" data-type="input-textbox" id="inputLetter" name="inputLetter" size="1" value="" />
                                </div>
                            </li>
                        </td>
                        <td>
                            <li class="form-line" id="id_2">
                                <div id="cid_2" class="form-input-wide">
                                    <div style="text-align:left" class="form-buttons-wrapper">
                                        <button id="input_2" type="submit" class="form-submit-button form-submit-button-simple_orange">
                                            Tentez votre chance !
                                        </button>
                                    </div>
                                </div>
                            </li>
                        
                            <li style="display:none">
                                Should be Empty:
                                <input type="text" name="website" value="" />
                            </li>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2">
                           
                            <h1>Lettres déjà testées :
                                <%
                                    Pendu pendu = (Pendu) request.getAttribute("pendu");
                                    for (Character c : pendu.getWordTested()) {
                                        out.println(" " + c);
                                    }
                                %></h1>

                            <h1>Le mot découvert : ${pendu.getDiscoverWord()}</h1>
                            <%
                                if (pendu.winner()) {
                                    out.println("<img src=\"victoire.jpg\"/>");
                                } else if (pendu.gameOver()) {
                                    out.println("<img src=\"perdu.jpg\"/>");
                                    out.println("<h1>Le mot à trouver était : " + pendu.getHiddenWord() + "</h1>");
                                }
                            %>
                            <br />
                            <br />
                            <a href="?newgame=true"><img src="Nouvelle_partie.png" width="300"/></a>
                        </td>
                        
                    </tr>
                    </table>
                </ul>
            </div>
            <input type="hidden" id="simple_spc" name="simple_spc" value="40364041732344" />
            <script type="text/javascript">
                document.getElementById("si" + "mple" + "_spc").value = "40364041732344-40364041732344";
            </script>
        </form>
        


    </p>
        <script language="javascript">
            document.getElementById('inputLetter').focus();
        </script>
</body>
</html>
