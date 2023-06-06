using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using UnityEngine.SceneManagement;

public class StartScreenController : MonoBehaviour
{
    public Slider intelligenceSlider;
    public Slider charismaSlider;
    public Slider confidenceSlider;
    public Slider empathySlider;

    private int intelligence;
    private int charisma;
    private int confidence;
    private int empathy;

    public TextAsset inkJSONAsset;
    private Story inkStory;
    public Button nextScene;


    // Start is called before the first frame update
    void Start()
    {
        Debug.Log("Let's-a go!");

        // Set initial values for the sliders
        intelligenceSlider.value = intelligence;
        charismaSlider.value = charisma;
        confidenceSlider.value = confidence;
        empathySlider.value = empathy;

        // Load the Ink story from the JSON file
        inkStory = new Story(inkJSONAsset.text);

    }

    // Update the corresponding stat when the sliders are adjusted

    private void UpdateInkVariables()
    {
        // Set the values of Ink variables with the updated stats
        inkStory.variablesState["intelligence"] = intelligence;
        inkStory.variablesState["charisma"] = charisma;
        inkStory.variablesState["confidence"] = confidence;
        inkStory.variablesState["empathy"] = empathy;
    }

    public void AdjustIntelligence(float value)
    {
        intelligence = Mathf.RoundToInt(value);
        Debug.Log("intelligence is: " + intelligence);
    }

    public void AdjustCharisma(float value)
    {
        charisma = Mathf.RoundToInt(value);
        Debug.Log("charisma is: " + charisma);
    }

    public void AdjustConfidence(float value)
    {
        confidence = Mathf.RoundToInt(value);
        Debug.Log("confidence is: " + confidence);
    }

    public void AdjustEmpathy(float value)
    {
        empathy = Mathf.RoundToInt(value);
        Debug.Log("empathy is: " + empathy);
    }

    // Update the static PlayerStats object
    private void UpdatePlayerStats()
    {
        PlayerStats.Instance.UpdatePlayerStats(
                intelligence,
                charisma,
                confidence,
                empathy);
    }

    // Method to handle the button click event to finalize stat adjustments
    public void FinalizeStatAdjustments()
    {
        // Update the Ink variables with the updated stat values
        UpdateInkVariables();

        // Update the GameObject PlayerStats
        UpdatePlayerStats();

        // Continue the Ink story from where it left off
        inkStory.Continue();
        Debug.Log("intelligence is: " + intelligence + "\n charisma is: " + charisma + "\n confidence is: " + confidence + "\n empathy is: " + empathy);
    }
    public void TransitionToScene(string sceneName)
    {
        SceneManager.LoadScene(sceneName);
    }
}