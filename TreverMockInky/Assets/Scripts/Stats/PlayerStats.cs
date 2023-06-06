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

    private void Awake()
    {
        // Singleton Instance.
        Instance = this;

        // This will ensure this gameobject doesn't get destroyed over scenes.
        DontDestroyOnLoad(gameObject);
    }
}
