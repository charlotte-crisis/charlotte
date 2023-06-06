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

        // Load the Ink story from the JSON file
        inkStory = new Story(inkJSONAsset.text);

    }

    private void SetStats()
    {
        // RoundToInt as value is a float.
        // Alternatively, can cast as such:
        // (int)slider.value

        intelligence = Mathf.RoundToInt(intelligenceSlider.value);
        charisma = Mathf.RoundToInt(charismaSlider.value);
        confidence = Mathf.RoundToInt(confidenceSlider.value);
        empathy = Mathf.RoundToInt(empathySlider.value);
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

    private void UpdateInkVariables()
    {
        // Set the values of Ink variables with the updated stats
        inkStory.variablesState["intelligence"] = intelligence;
        inkStory.variablesState["charisma"] = charisma;
        inkStory.variablesState["confidence"] = confidence;
        inkStory.variablesState["empathy"] = empathy;
    }

    // Method to handle the button click event to finalize stat adjustments
    public void FinalizeStatAdjustments()
    {
        // Get the current slider values.
        SetStats();

        // Update the Ink variables with the updated stat values.
        UpdateInkVariables();

        // Update the GameObject PlayerStats.
        UpdatePlayerStats();

        // Continue the Ink story from where it left off
        inkStory.Continue();
        Debug.Log("intelligence is: " + intelligence + "\n charisma is: " + charisma + "\n confidence is: " + confidence + "\n empathy is: " + empathy);
    }

    // TODO: put this in FinalizeStatAdjustments and also hard code the scene name inside.
    public void TransitionToScene(string sceneName)
    {
        SceneManager.LoadScene(sceneName);
    }
}