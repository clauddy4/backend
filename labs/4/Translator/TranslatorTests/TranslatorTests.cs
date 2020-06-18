using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;
using Translator;

namespace TranslatorTests
{
    [TestClass]
    public class TranslatorTests
    {
        Translator.Translator dictionary = new Translator.Translator("../../../../Translator/dictionary.txt");
        [TestMethod]
        public void Translate_WithEmptyWord()
        {
            string word = "";
            string result = dictionary.Translate(word);
            Assert.AreEqual(null, result);
        }
        [TestMethod]
        public void Translate_WithUnknownEnWord_ShouldReturnNull()
        {
            string word = "some";
            string result = dictionary.Translate(word);
            Assert.AreEqual(null, result);
        }
        [TestMethod]
        public void Translate_WithUnknownRuWord_ShouldReturnNull()
        {
            string word = "еда";
            string result = dictionary.Translate(word);
            Assert.AreEqual(null, result);
        }
        [TestMethod]
        public void Translate_WithRuWord_ShouldReturnEnTranslation()
        {
            string word = "пять";
            string translation = dictionary.Translate(word);
            Assert.AreEqual("five", translation);
        }
        [TestMethod]
        public void Translate_WithEnWord_ShouldReturnRuTranslation()
        {
            string word = "five";
            string translation = dictionary.Translate(word);
            Assert.AreEqual("пять", translation);
        }
    }
}
