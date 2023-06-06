using System.Collections;
using System.Collections.Generic;
using UnityEngine;

// For text
using UnityEngine.UI;

public class SliderManager : MonoBehaviour
{
    private Text textIndicator;

    void Start()
    {
        textIndicator = GetComponent<Text>();
    }

    public void UpdateAmountIndicator(float value)
    {
        textIndicator.text = "" + Mathf.RoundToInt(value);
    }
}
