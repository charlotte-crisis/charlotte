using System.Collections;
using System.Collections.Generic;
using UnityEngine;

/*
    Reference:
    https://learn.unity.com/tutorial/implement-data-persistence-between-scenes#
*/
public class PlayerStats : MonoBehaviour
{
    // Get this by calling PlayerStats.Instance in other scripts.
    // Static keyword is important.
    public static PlayerStats Instance;

    // Stats to be decided at the start of game.
    // Can refactor name next time if needed.
    public int stat_intelligence;
    public int stat_charisma;
    public int stat_confidence;
    public int stat_empathy;

    private void Awake()
    {
        // Start of new code (avoid duplicate GameObject)
        if (Instance != null) 
        {
            Destroy(gameObject);
            return;
        }

        // Singleton Instance.
        Instance = this;

        // This will ensure this gameobject doesn't get destroyed over scenes.
        DontDestroyOnLoad(gameObject);
    }

    // Update the stats through this method.
    public void UpdatePlayerStats(
            int intelligence,
            int charisma,
            int confidence,
            int empathy)
    {
        Instance.stat_intelligence = intelligence;
        Instance.stat_charisma = charisma;
        Instance.stat_confidence = confidence;
        Instance.stat_empathy = empathy;

        Debug.Log("Instance Updated: ");
        Debug.Log("Int: " + Instance.stat_intelligence);
    }
}
